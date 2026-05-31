--| The single source of truth for the whisky catalogue.
--
--  Every bottle is one `whiskies/<id>.dhall` file built from the constructors
--  exported at the bottom of this file. The Haskell renderer (`whisky-catalogue`)
--  decodes these into typed values and generates all the markdown views.
--
--  Design notes:
--    * `Classification` is a sum type so each whisky tradition carries exactly the
--      fields that are real for it — no `Optional ScotchRegion` smeared over bourbon.
--    * Region is NOT hand-typed: it is a total function of the distillery
--      (`regionOf`), resolved once here by the `scotchSingleMalt`/`scotchSingleGrain`
--      constructors. Add a distillery and the `merge` stops type-checking until you
--      record its region.
--    * The four facets (ownership / tasting / wishlist / recommendation) are
--      orthogonal Optionals — present iff they apply. A sampled-but-wanted bottle
--      has `tasting` + `wishlist`; a sealed bottle has `ownership` only.

-- ============================================================================
-- Controlled vocabularies
-- ============================================================================

let ScotchRegion = < Islay | Speyside | Highland | Lowland | Campbeltown | Islands >

let ScotchDistillery =
      < Oban
      | Dalwhinnie
      | Glenmorangie
      | Kilchoman
      | Ardbeg
      | Macallan
      | Aberlour
      | GlenDronach
      | Glenfarclas
      | Glenlivet
      | Balvenie
      | Springbank
      | Glengyle
      | HighlandPark
      | GlenScotia
      | GlenGrant
      | Laphroaig
      | Lagavulin
      | Glenfiddich
      | Bruichladdich
      >

let ScotchBlender = < CompassBox | JohnnieWalker >

let AmericanProducer =
      < BuffaloTrace
      | WoodfordReserve
      | WidowJane
      | WildTurkey
      | HeavenHill
      | MakersMark
      | Michters
      | WhistlePig
      >

let MashType = < Bourbon | Rye | Wheat | Corn | Malt >

let IrishProducer = < Midleton | Bushmills | Teeling >

let IrishStyle = < SinglePotStill | SingleMalt | SingleGrain | Blend >

let JapaneseProducer = < Nikka | Suntory >

let JapaneseStyle = < SingleMalt | Blend | SingleGrain >

let WorldCountry = < India | Taiwan | Australia | SouthAfrica >

-- ============================================================================
-- Region is a total function of the distillery — exhaustive, single-sourced.
-- ============================================================================

let regionOf
    : ScotchDistillery -> ScotchRegion
    = \(d : ScotchDistillery) ->
        merge
          { Oban = ScotchRegion.Highland
          , Dalwhinnie = ScotchRegion.Highland
          , Glenmorangie = ScotchRegion.Highland
          , Kilchoman = ScotchRegion.Islay
          , Ardbeg = ScotchRegion.Islay
          , Macallan = ScotchRegion.Speyside
          , Aberlour = ScotchRegion.Speyside
          , GlenDronach = ScotchRegion.Highland
          , Glenfarclas = ScotchRegion.Speyside
          , Glenlivet = ScotchRegion.Speyside
          , Balvenie = ScotchRegion.Speyside
          , Springbank = ScotchRegion.Campbeltown
          , Glengyle = ScotchRegion.Campbeltown
          , HighlandPark = ScotchRegion.Islands
          , GlenScotia = ScotchRegion.Campbeltown
          , GlenGrant = ScotchRegion.Speyside
          , Laphroaig = ScotchRegion.Islay
          , Lagavulin = ScotchRegion.Islay
          , Glenfiddich = ScotchRegion.Speyside
          , Bruichladdich = ScotchRegion.Islay
          }
          d

-- ============================================================================
-- Classification — what the whisky *is*
-- ============================================================================

-- Single-distillery Scotch carries a region (derived); blends carry a blender.
let ScotchSingle = { distillery : ScotchDistillery, region : ScotchRegion }

let Scotch =
      < SingleMalt : ScotchSingle
      | SingleGrain : ScotchSingle
      | BlendedMalt : ScotchBlender
      | BlendedGrain : ScotchBlender
      | Blend : ScotchBlender
      >

let American =
      { producer : AmericanProducer
      , mash : MashType
      , bottledInBond : Bool
      , singleBarrel : Bool
      }

let Irish = { producer : IrishProducer, style : IrishStyle }

let Japanese = { producer : JapaneseProducer, style : JapaneseStyle }

-- The long tail: enumerate the country, keep producer/style loose to avoid churn.
let World = { country : WorldCountry, producer : Text, style : Text }

let Classification =
      < Scotch : Scotch
      | American : American
      | Irish : Irish
      | Japanese : Japanese
      | World : World
      >

-- ============================================================================
-- Facets — my *relationship* to the bottle (all orthogonal, all optional)
-- ============================================================================

let Status = < Sealed | Open | Finished >

let OwnershipType =
      { status : Status
      , paid : Optional Text
      , boughtWhere : Optional Text
      , boughtWhen : Optional Text
      }

let Ownership =
      { Type = OwnershipType
      , default =
        { paid = None Text, boughtWhere = None Text, boughtWhen = None Text }
      }

let Confidence = < Low | Normal >

let TastingType =
      { rating : Natural
      , confidence : Confidence
      , summary : Text
      , journal : Optional Text
      }

let Tasting = { Type = TastingType, default.journal = None Text }

let Priority = < High | Medium | Low >

let WishlistType =
      { priority : Priority
      , estPrice : Text
      , market : Text
      , claudePick : Bool
      , tryFirst : Bool
      , why : Text
      }

let Wishlist =
      { Type = WishlistType, default = { claudePick = False, tryFirst = False } }

let Tier = < Entry | Benchmark | Splurge >

let Findability = < Green | Amber | Red >

let RecommendationType =
      { tier : Tier, styleGroup : Text, findability : Findability, note : Text }

let Recommendation = { Type = RecommendationType, default = {=} }

-- ============================================================================
-- The Whisky record (with defaults so per-bottle files stay terse)
-- ============================================================================

let WhiskyType =
      { id : Text
      , name : Text
      , classification : Classification
      , abv : Double
      , age : Optional Natural
      , casks : List Text
      , ownership : Optional OwnershipType
      , tasting : Optional TastingType
      , wishlist : Optional WishlistType
      , recommendation : Optional RecommendationType
      }

let Whisky =
      { Type = WhiskyType
      , default =
        { age = None Natural
        , casks = [] : List Text
        , ownership = None OwnershipType
        , tasting = None TastingType
        , wishlist = None WishlistType
        , recommendation = None RecommendationType
        }
      }

-- ============================================================================
-- Classification constructors (region resolved here, once)
-- ============================================================================

let scotchSingleMalt
    : ScotchDistillery -> Classification
    = \(d : ScotchDistillery) ->
        Classification.Scotch
          (Scotch.SingleMalt { distillery = d, region = regionOf d })

let scotchSingleGrain
    : ScotchDistillery -> Classification
    = \(d : ScotchDistillery) ->
        Classification.Scotch
          (Scotch.SingleGrain { distillery = d, region = regionOf d })

let scotchBlendedMalt
    : ScotchBlender -> Classification
    = \(b : ScotchBlender) -> Classification.Scotch (Scotch.BlendedMalt b)

let scotchBlendedGrain
    : ScotchBlender -> Classification
    = \(b : ScotchBlender) -> Classification.Scotch (Scotch.BlendedGrain b)

let scotchBlend
    : ScotchBlender -> Classification
    = \(b : ScotchBlender) -> Classification.Scotch (Scotch.Blend b)

let american
    : American -> Classification
    = \(a : American) -> Classification.American a

let irish
    : Irish -> Classification
    = \(i : Irish) -> Classification.Irish i

let japanese
    : Japanese -> Classification
    = \(j : Japanese) -> Classification.Japanese j

let world
    : World -> Classification
    = \(w : World) -> Classification.World w

in  { -- types
      ScotchRegion
    , ScotchDistillery
    , ScotchBlender
    , AmericanProducer
    , MashType
    , IrishProducer
    , IrishStyle
    , JapaneseProducer
    , JapaneseStyle
    , WorldCountry
    , Scotch
    , American
    , Irish
    , Japanese
    , World
    , Classification
    , Status
    , Ownership
    , Confidence
    , Tasting
    , Priority
    , Wishlist
    , Tier
    , Findability
    , Recommendation
    , Whisky
      -- functions / constructors
    , regionOf
    , scotchSingleMalt
    , scotchSingleGrain
    , scotchBlendedMalt
    , scotchBlendedGrain
    , scotchBlend
    , american
    , irish
    , japanese
    , world
    }
