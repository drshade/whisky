--| The single source of truth for the whisky catalogue.
--
--  Every bottle is one `whiskies/<id>.dhall` file. Each references a producer from
--  the shared registry (`schema/Producers.dhall`) and carries its own `style`; the
--  Haskell renderer (`whisky-catalogue`) decodes them and generates the markdown.
--
--  Design notes:
--    * A `Producer` is a first-class entity defined ONCE in `Producers.dhall`
--      (name + kind + origin). Whiskies point to one — origin/region is never
--      restated per bottle.
--    * `style` is the bottling's own classification (single malt, bourbon, …),
--      independent of the producer. Producer/style validity (e.g. a blender can't
--      bottle a single malt) is checked at build time, not by the type system —
--      the cost of a single uniform producer list.
--    * The four facets (ownership / tasting / wishlist / recommendation) are
--      orthogonal Optionals — present iff they apply.

-- ============================================================================
-- Producer — the referenced entity (instances live in ./Producers.dhall)
-- ============================================================================

-- Origin at a uniform granularity: Scotch region OR country.
let Origin =
      < Islay
      | Speyside
      | Highland
      | Lowland
      | Campbeltown
      | Islands
      | Kentucky
      | Tennessee
      | Indiana
      | USA
      | Ireland
      | Japan
      | India
      | Taiwan
      | Australia
      | SouthAfrica
      | ScotlandBlend
      >

let ProducerKind = < Distillery | Blender | Bottler | GrainDistillery >

let Producer = { name : Text, kind : ProducerKind, origin : Origin }

-- ============================================================================
-- Style — the bottling's own classification
-- ============================================================================

let Style =
      < SingleMalt
      | SingleGrain
      | BlendedMalt
      | BlendedGrain
      | Blend
      | Bourbon
      | Rye
      | Wheated
      | SinglePotStill
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

let Market = < NlEu | Sa >

let Currency = < Eur | Zar >

let Price = { amount : Natural, currency : Currency }

let WishlistType =
      { priority : Priority
      , price : Price
      , market : Market
      , claudePick : Bool
      , tryFirst : Bool
      , why : Text
      }

let Wishlist =
      { Type = WishlistType, default = { claudePick = False, tryFirst = False } }

let Tier = < Entry | Benchmark | Splurge >

let Findability = < Green | Amber | Red >

-- The recommendations doc's curated exploration sections (not the bottle's `style`).
let Theme =
      < RyeWhiskey
      | IrishPotStill
      | CampbeltownMalts
      | JapaneseWhisky
      | BrightSpeyside
      | OtherWorld
      | WheatedBourbon
      | ClassicIslay
      >

let RecommendationType =
      { tier : Tier, theme : Theme, findability : Findability, note : Text }

let Recommendation = { Type = RecommendationType, default = {=} }

-- ============================================================================
-- The Whisky record (with defaults so per-bottle files stay terse)
-- ============================================================================

let WhiskyType =
      { id : Text
      , name : Text
      , producer : Producer
      , style : Style
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

in  { Origin
    , ProducerKind
    , Producer
    , Style
    , Status
    , Ownership
    , Confidence
    , Tasting
    , Priority
    , Market
    , Currency
    , Price
    , Wishlist
    , Tier
    , Findability
    , Theme
    , Recommendation
    , Whisky
    }
