-- | Haskell mirror of @schema/Whisky.dhall@, plus the derived presentation
--   helpers the renderers use. The structure matches the Dhall schema field-for-
--   field so @dhall@'s generic decoding works.
--
--   A 'Producer' is a referenced entity (instances in @producers.dhall@); a whisky
--   points to one and carries its own 'Style'. 'Priority' keeps a 2-letter prefix
--   (its @Low@ would clash with @Confidence.Low@) stripped back to the Dhall name.
module Whisky.Types
  ( -- * Producer
    Origin (..)
  , ProducerKind (..)
  , Producer (..)
    -- * Style
  , Style (..)
    -- * Facets
  , Status (..)
  , Ownership (..)
  , Confidence (..)
  , Tasting (..)
  , Priority (..)
  , Market (..)
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
  , originLabel
  , styleLabel
  ) where

import qualified Data.Text as Text
import           Dhall (FromDhall (..))
import           Dhall.Marshal.Decode
                   ( InterpretOptions (..), defaultInterpretOptions
                   , genericAutoWithInputNormalizer )

-- ============================================================================
-- Producer
-- ============================================================================

data Origin
  = Islay | Speyside | Highland | Lowland | Campbeltown | Islands
  | Kentucky | Tennessee | Indiana | USA
  | Ireland | Japan | India | Taiwan | Australia | SouthAfrica
  | ScotlandBlend
  deriving (Generic, Show, Eq)

instance FromDhall Origin

data ProducerKind = Distillery | Blender | Bottler | GrainDistillery
  deriving (Generic, Show, Eq)

instance FromDhall ProducerKind

data Producer = MkProducer
  { name :: Text
  , kind :: ProducerKind
  , origin :: Origin
  }
  deriving (Generic, Show, Eq)

instance FromDhall Producer

-- ============================================================================
-- Style
-- ============================================================================

data Style
  = SingleMalt | SingleGrain | BlendedMalt | BlendedGrain | Blend
  | Bourbon | Rye | Wheated | SinglePotStill
  deriving (Generic, Show, Eq)

instance FromDhall Style

-- ============================================================================
-- Facets
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

-- | @Low@ clashes with @Confidence.Low@, so prefix and strip it back to the Dhall name.
data Priority = PrHigh | PrMedium | PrLow
  deriving (Generic, Show, Eq)

instance FromDhall Priority where
  autoWith =
    genericAutoWithInputNormalizer
      (defaultInterpretOptions { constructorModifier = Text.drop 2 })

data Market = NlEu | Sa
  deriving (Generic, Show, Eq)

instance FromDhall Market

data Wishlist = MkWishlist
  { priority :: Priority
  , estPrice :: Text
  , market :: Market
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
  , producer :: Producer
  , style :: Style
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

producerName :: Whisky -> Text
producerName w = w.producer.name

regionLabel :: Whisky -> Text
regionLabel w = originLabel w.producer.origin

typeLabel :: Whisky -> Text
typeLabel w = styleLabel w.style

originLabel :: Origin -> Text
originLabel = \case
  Islay -> "Islay"
  Speyside -> "Speyside"
  Highland -> "Highland"
  Lowland -> "Lowland"
  Campbeltown -> "Campbeltown"
  Islands -> "Islands"
  Kentucky -> "Kentucky"
  Tennessee -> "Tennessee"
  Indiana -> "Indiana"
  USA -> "USA"
  Ireland -> "Ireland"
  Japan -> "Japan"
  India -> "India"
  Taiwan -> "Taiwan"
  Australia -> "Australia"
  SouthAfrica -> "South Africa"
  ScotlandBlend -> "Scotland (blend)"

styleLabel :: Style -> Text
styleLabel = \case
  SingleMalt -> "Single malt"
  SingleGrain -> "Single grain"
  BlendedMalt -> "Blended malt"
  BlendedGrain -> "Blended grain"
  Blend -> "Blend"
  Bourbon -> "Bourbon"
  Rye -> "Rye"
  Wheated -> "Wheated bourbon"
  SinglePotStill -> "Single pot still"
