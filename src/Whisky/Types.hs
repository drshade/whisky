-- | Haskell mirror of @schema/Whisky.dhall@, plus the derived presentation
--   helpers the renderers use. The structure matches the Dhall schema field-for-
--   field so @dhall@'s generic decoding "just works"; see 'FromDhall' instances.
--
--   Constructor naming: Haskell has a single flat constructor namespace, but the
--   Dhall unions reuse names across types (@SingleMalt@ lives in Scotch, Irish and
--   Japanese; @Low@ in Priority and Confidence). Clashing union types therefore use
--   a 2-letter prefix on their constructors and strip it back to the Dhall name with
--   @constructorModifier = Text.drop 2@. Record constructors are @Mk@-prefixed; their
--   names are irrelevant to decoding (records map by field name).
module Whisky.Types
  ( -- * Controlled vocabularies
    ScotchRegion (..)
  , ScotchDistillery (..)
  , ScotchBlender (..)
  , AmericanProducer (..)
  , MashType (..)
  , IrishProducer (..)
  , IrishStyle (..)
  , JapaneseProducer (..)
  , JapaneseStyle (..)
  , WorldCountry (..)
    -- * Classification
  , ScotchSingle (..)
  , Scotch (..)
  , American (..)
  , Irish (..)
  , Japanese (..)
  , World (..)
  , Classification (..)
    -- * Facets
  , Status (..)
  , Ownership (..)
  , Confidence (..)
  , Tasting (..)
  , Priority (..)
  , Wishlist (..)
  , Tier (..)
  , Findability (..)
  , Recommendation (..)
    -- * The whisky record
  , Whisky (..)
    -- * Derived presentation helpers
  , producerName
  , regionLabel
  , typeLabel
  ) where

import qualified Data.Text as Text
import           Dhall (FromDhall (..))
import           Dhall.Marshal.Decode
                   ( InterpretOptions (..), defaultInterpretOptions
                   , genericAutoWithInputNormalizer )

-- ============================================================================
-- Controlled vocabularies (unique constructors → default generic decoding)
-- ============================================================================

data ScotchRegion = Islay | Speyside | Highland | Lowland | Campbeltown | Islands
  deriving (Generic, Show, Eq)

data ScotchDistillery
  = Oban | Dalwhinnie | Glenmorangie | Kilchoman | Ardbeg | Macallan
  | Aberlour | GlenDronach | Glenfarclas | Glenlivet | Balvenie | Springbank
  | Glengyle | HighlandPark | GlenScotia | GlenGrant | Laphroaig | Lagavulin
  | Glenfiddich | Bruichladdich
  deriving (Generic, Show, Eq)

data ScotchBlender = CompassBox | JohnnieWalker
  deriving (Generic, Show, Eq)

data AmericanProducer
  = BuffaloTrace | WoodfordReserve | WidowJane | WildTurkey | HeavenHill
  | MakersMark | Michters | WhistlePig
  deriving (Generic, Show, Eq)

data MashType = Bourbon | Rye | Wheat | Corn | Malt
  deriving (Generic, Show, Eq)

data IrishProducer = Midleton | Bushmills | Teeling
  deriving (Generic, Show, Eq)

data JapaneseProducer = Nikka | Suntory
  deriving (Generic, Show, Eq)

data WorldCountry = India | Taiwan | Australia | SouthAfrica
  deriving (Generic, Show, Eq)

instance FromDhall ScotchRegion
instance FromDhall ScotchDistillery
instance FromDhall ScotchBlender
instance FromDhall AmericanProducer
instance FromDhall MashType
instance FromDhall IrishProducer
instance FromDhall JapaneseProducer
instance FromDhall WorldCountry

-- ============================================================================
-- Clashing union types: prefix + strip back to the Dhall alternative name
-- ============================================================================

-- | Strip a 2-letter Haskell-only prefix to recover the Dhall constructor name.
stripPrefixOpts :: InterpretOptions
stripPrefixOpts = defaultInterpretOptions { constructorModifier = Text.drop 2 }

data IrishStyle = IrSinglePotStill | IrSingleMalt | IrSingleGrain | IrBlend
  deriving (Generic, Show, Eq)

instance FromDhall IrishStyle where
  autoWith = genericAutoWithInputNormalizer stripPrefixOpts

data JapaneseStyle = JpSingleMalt | JpBlend | JpSingleGrain
  deriving (Generic, Show, Eq)

instance FromDhall JapaneseStyle where
  autoWith = genericAutoWithInputNormalizer stripPrefixOpts

data Priority = PrHigh | PrMedium | PrLow
  deriving (Generic, Show, Eq)

instance FromDhall Priority where
  autoWith = genericAutoWithInputNormalizer stripPrefixOpts

-- ============================================================================
-- Classification — what the whisky *is*
-- ============================================================================

data ScotchSingle = MkScotchSingle { distillery :: ScotchDistillery, region :: ScotchRegion }
  deriving (Generic, Show, Eq)

instance FromDhall ScotchSingle

data Scotch
  = ScSingleMalt ScotchSingle
  | ScSingleGrain ScotchSingle
  | ScBlendedMalt ScotchBlender
  | ScBlendedGrain ScotchBlender
  | ScBlend ScotchBlender
  deriving (Generic, Show, Eq)

instance FromDhall Scotch where
  autoWith = genericAutoWithInputNormalizer stripPrefixOpts

data American = MkAmerican
  { producer :: AmericanProducer
  , mash :: MashType
  , bottledInBond :: Bool
  , singleBarrel :: Bool
  }
  deriving (Generic, Show, Eq)

data Irish = MkIrish { producer :: IrishProducer, style :: IrishStyle }
  deriving (Generic, Show, Eq)

data Japanese = MkJapanese { producer :: JapaneseProducer, style :: JapaneseStyle }
  deriving (Generic, Show, Eq)

data World = MkWorld { country :: WorldCountry, producer :: Text, style :: Text }
  deriving (Generic, Show, Eq)

instance FromDhall American
instance FromDhall Irish
instance FromDhall Japanese
instance FromDhall World

data Classification
  = Scotch Scotch
  | American American
  | Irish Irish
  | Japanese Japanese
  | World World
  deriving (Generic, Show, Eq)

instance FromDhall Classification

-- ============================================================================
-- Facets — my *relationship* to the bottle
-- ============================================================================

data Status = Sealed | Open | Finished
  deriving (Generic, Show, Eq)

instance FromDhall Status

data Ownership = MkOwnership
  { status :: Status
  , paid :: Maybe Text
  , boughtWhere :: Maybe Text
  , boughtWhen :: Maybe Text
  }
  deriving (Generic, Show, Eq)

instance FromDhall Ownership

data Confidence = Low | Normal
  deriving (Generic, Show, Eq)

instance FromDhall Confidence

data Tasting = MkTasting
  { rating :: Natural
  , confidence :: Confidence
  , summary :: Text
  , journal :: Maybe Text
  }
  deriving (Generic, Show, Eq)

instance FromDhall Tasting

data Wishlist = MkWishlist
  { priority :: Priority
  , estPrice :: Text
  , market :: Text
  , claudePick :: Bool
  , tryFirst :: Bool
  , why :: Text
  }
  deriving (Generic, Show, Eq)

instance FromDhall Wishlist

data Tier = Entry | Benchmark | Splurge
  deriving (Generic, Show, Eq)

instance FromDhall Tier

data Findability = Green | Amber | Red
  deriving (Generic, Show, Eq)

instance FromDhall Findability

data Recommendation = MkRecommendation
  { tier :: Tier
  , styleGroup :: Text
  , findability :: Findability
  , note :: Text
  }
  deriving (Generic, Show, Eq)

instance FromDhall Recommendation

-- ============================================================================
-- The Whisky record
-- ============================================================================

data Whisky = MkWhisky
  { id :: Text
  , name :: Text
  , classification :: Classification
  , abv :: Double
  , age :: Maybe Natural
  , casks :: [Text]
  , ownership :: Maybe Ownership
  , tasting :: Maybe Tasting
  , wishlist :: Maybe Wishlist
  , recommendation :: Maybe Recommendation
  }
  deriving (Generic, Show, Eq)

instance FromDhall Whisky

-- ============================================================================
-- Derived presentation helpers
-- ============================================================================

-- | Human display name of the producer / distillery / blender.
producerName :: Classification -> Text
producerName = \case
  Scotch s -> case s of
    ScSingleMalt x -> distilleryName x.distillery
    ScSingleGrain x -> distilleryName x.distillery
    ScBlendedMalt b -> blenderName b
    ScBlendedGrain b -> blenderName b
    ScBlend b -> blenderName b
  American a -> americanProducerName a.producer
  Irish i -> irishProducerName i.producer
  Japanese j -> japaneseProducerName j.producer
  World w -> w.producer

-- | Region / origin label as shown in the collection and README tables.
regionLabel :: Classification -> Text
regionLabel = \case
  Scotch s -> case s of
    ScSingleMalt x -> regionName x.region
    ScSingleGrain x -> regionName x.region
    ScBlendedMalt _ -> "Scotland (malt)"
    ScBlendedGrain _ -> "Scotland (grain)"
    ScBlend _ -> "Scotland (blend)"
  American a -> americanOrigin a.producer
  Irish _ -> "Ireland"
  Japanese _ -> "Japan"
  World w -> worldCountryName w.country

-- | Style label ("Single malt", "Bourbon", …) for the collection "Type" column.
typeLabel :: Classification -> Text
typeLabel = \case
  Scotch s -> case s of
    ScSingleMalt _ -> "Single malt"
    ScSingleGrain _ -> "Single grain"
    ScBlendedMalt _ -> "Blended malt"
    ScBlendedGrain _ -> "Blended grain"
    ScBlend _ -> "Blended Scotch"
  American a -> case a.mash of
    Rye -> "Rye"
    Malt -> "Single malt"
    _ -> "Bourbon"
  Irish i -> case i.style of
    IrSinglePotStill -> "Single pot still"
    IrSingleMalt -> "Single malt"
    IrSingleGrain -> "Single grain"
    IrBlend -> "Blend"
  Japanese j -> case j.style of
    JpSingleMalt -> "Single malt"
    JpSingleGrain -> "Single grain"
    JpBlend -> "Blend"
  World w -> w.style

-- --- enum → text -----------------------------------------------------------

regionName :: ScotchRegion -> Text
regionName = \case
  Islay -> "Islay"
  Speyside -> "Speyside"
  Highland -> "Highland"
  Lowland -> "Lowland"
  Campbeltown -> "Campbeltown"
  Islands -> "Islands"

distilleryName :: ScotchDistillery -> Text
distilleryName = \case
  Oban -> "Oban"
  Dalwhinnie -> "Dalwhinnie"
  Glenmorangie -> "Glenmorangie"
  Kilchoman -> "Kilchoman"
  Ardbeg -> "Ardbeg"
  Macallan -> "Macallan"
  Aberlour -> "Aberlour"
  GlenDronach -> "GlenDronach"
  Glenfarclas -> "Glenfarclas"
  Glenlivet -> "Glenlivet"
  Balvenie -> "Balvenie"
  Springbank -> "Springbank"
  Glengyle -> "Glengyle"
  HighlandPark -> "Highland Park"
  GlenScotia -> "Glen Scotia"
  GlenGrant -> "Glen Grant"
  Laphroaig -> "Laphroaig"
  Lagavulin -> "Lagavulin"
  Glenfiddich -> "Glenfiddich"
  Bruichladdich -> "Bruichladdich"

blenderName :: ScotchBlender -> Text
blenderName = \case
  CompassBox -> "Compass Box"
  JohnnieWalker -> "Johnnie Walker"

americanProducerName :: AmericanProducer -> Text
americanProducerName = \case
  BuffaloTrace -> "Buffalo Trace"
  WoodfordReserve -> "Woodford Reserve"
  WidowJane -> "Widow Jane"
  WildTurkey -> "Wild Turkey"
  HeavenHill -> "Heaven Hill"
  MakersMark -> "Maker's Mark"
  Michters -> "Michter's"
  WhistlePig -> "WhistlePig"

americanOrigin :: AmericanProducer -> Text
americanOrigin = \case
  BuffaloTrace -> "Kentucky"
  WoodfordReserve -> "Kentucky"
  WidowJane -> "USA"
  WildTurkey -> "Kentucky"
  HeavenHill -> "Kentucky"
  MakersMark -> "Kentucky"
  Michters -> "Kentucky"
  WhistlePig -> "USA"

irishProducerName :: IrishProducer -> Text
irishProducerName = \case
  Midleton -> "Midleton"
  Bushmills -> "Bushmills"
  Teeling -> "Teeling"

japaneseProducerName :: JapaneseProducer -> Text
japaneseProducerName = \case
  Nikka -> "Nikka"
  Suntory -> "Suntory"

worldCountryName :: WorldCountry -> Text
worldCountryName = \case
  India -> "India"
  Taiwan -> "Taiwan"
  Australia -> "Australia"
  SouthAfrica -> "South Africa"
