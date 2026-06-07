{-# LANGUAGE OverloadedLabels #-}

-- | The repl query vocabulary: a small optics layer over the catalogue.
--
--   Philosophy: name each data *path* once as an optic, then compose. The
--   verbs ('with', 'whose', 'pick', 'rankBy') bridge optics back to plain
--   lists so common questions don't need operator soup — but raw record-dot
--   and list comprehensions remain first-class; mix freely.
--
--   Typical session:
--
--   > ws <- loadAll
--   > ws & whose notes (=~ "honey") & pick #name
--   > ws & whose origin (== Speyside) & rankBy rating & pick #name
module Whisky.Query
  ( -- * Loading
    loadAll
    -- * Facet folds
  , _tasting
  , _ownership
  , _wishlist
  , _recommendation
    -- * Composite paths
  , rating
  , origin
  , nose
  , palate
  , finish
  , noteSummary
  , notes
    -- * Matching
  , (=~)
  , like
    -- * Query verbs
  , with
  , without
  , whose
  , pick
  , rankBy
  ) where

import qualified Data.Text as T
import           Optics.Core hiding (without) -- our list verb shadows the prism combinator
import           Prelude hiding ((%)) -- rerebase re-exports Data.Ratio.(%); optics' wins here
import           Whisky.Load (loadWhiskies)
import           Whisky.Types

-- ============================================================================
-- Loading
-- ============================================================================

-- | Both collections at once — owned/wanted bottles *and* the facts-only
--   reference cache. Repl convenience only; the generator loads them
--   separately (reference entries must stay out of the views).
loadAll :: IO [Whisky]
loadAll = (<>) <$> loadWhiskies "whiskies" <*> loadWhiskies "reference"

-- ============================================================================
-- Facet folds — the Maybe unwrapped once, for all of them
-- ============================================================================

_tasting :: AffineTraversal' Whisky Tasting
_tasting = #tasting % _Just

_ownership :: AffineTraversal' Whisky Ownership
_ownership = #ownership % _Just

_wishlist :: AffineTraversal' Whisky Wishlist
_wishlist = #wishlist % _Just

_recommendation :: AffineTraversal' Whisky Recommendation
_recommendation = #recommendation % _Just

-- ============================================================================
-- Composite paths
-- ============================================================================

-- | The personal rating, when tasted.
rating :: AffineTraversal' Whisky Natural
rating = _tasting % #rating

-- | Region/country comes from the producer; this names the hop.
origin :: Lens' Whisky Origin
origin = #producer % #origin

-- | One external-note field across every recorded source.
noteField :: Lens' ExternalNotes (Maybe Text) -> Fold Whisky Text
noteField f = #externalNotes % folded % f % _Just

nose, palate, finish, noteSummary :: Fold Whisky Text
nose = noteField #nose
palate = noteField #palate
finish = noteField #finish
noteSummary = noteField #summary

-- | All external-note text — nose, palate, finish and summary together.
notes :: Fold Whisky Text
notes = noteSummary `summing` nose `summing` palate `summing` finish

-- ============================================================================
-- Matching
-- ============================================================================

-- | Case-insensitive substring match: @t =~ "honey"@.
(=~) :: Text -> Text -> Bool
t =~ pat = T.toLower pat `T.isInfixOf` T.toLower t

infix 4 =~

-- | '(=~)' as an optic — composes into a path to keep only matching text,
--   e.g. the matching fragments themselves: @ws & pick (nose % like "peat")@.
--   (For whisky-level filtering prefer @whose nose (=~ "peat")@; optics'
--   'filteredBy' needs an affine argument, so it won't take a list-shaped
--   fold like @nose % like "peat"@.)
like :: Text -> AffineFold Text Text
like pat = filtered (=~ pat)

-- ============================================================================
-- Query verbs — folds back to lists
-- ============================================================================

-- | Keep whiskies where the path hits anything: @ws & with _tasting@.
with :: Is k A_Fold => Optic' k is Whisky a -> [Whisky] -> [Whisky]
with k = filter (has k)

-- | Keep whiskies where the path hits nothing: @ws & without _ownership@.
without :: Is k A_Fold => Optic' k is Whisky a -> [Whisky] -> [Whisky]
without k = filter (not . has k)

-- | Keep whiskies where any hit satisfies the predicate:
--   @ws & whose rating (>= 85)@.
whose :: Is k A_Fold => Optic' k is Whisky a -> (a -> Bool) -> [Whisky] -> [Whisky]
whose k p = filter (anyOf k p)

-- | Project the path out of every whisky: @ws & pick #name@.
pick :: Is k A_Fold => Optic' k is Whisky a -> [Whisky] -> [a]
pick k = concatMap (toListOf k)

-- | Sort descending by the path's best hit; whiskies missing it sort last:
--   @ws & rankBy rating@.
rankBy :: (Is k A_Fold, Ord b) => Optic' k is Whisky b -> [Whisky] -> [Whisky]
rankBy k = sortOn (Down . maximumOf k)
