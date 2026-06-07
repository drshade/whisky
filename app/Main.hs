module Main where

import qualified Data.Text as Text
import qualified Data.Text.IO as T
import           System.Directory
                   (createDirectoryIfMissing, doesDirectoryExist, doesFileExist)
import           Whisky.Load (loadWhiskiesWith)
import           Whisky.Types (Tasting (..), Whisky (..))
import           Whisky.Render
                   ( renderCollection, renderReadme, renderRecommendations
                   , renderWishlist, validate, validateFiles, validateReference )

-- | Regenerate the catalogue markdown from the Dhall data. Run from the repo root.
--   README.md stays at the root (it's the GitHub landing dashboard); the detailed
--   tables are written into docs/.
--
--   Two collections are loaded: @whiskies/@ (bottles with a personal facet —
--   these drive every view) and @reference/@ (facts-only cache of bottles merely
--   known about — validated, queryable in the repl, but rendered nowhere).
--
--   Validation has two severities: plausibility warnings ('validate') are
--   printed but don't block; structural errors — id/filename drift, duplicate
--   ids, facets on reference entries, dangling journal links — fail the build.
main :: IO ()
main = do
  wsP <- loadWhiskiesWith "whiskies"
  refsP <- do
    hasRef <- doesDirectoryExist "reference"
    if hasRef then loadWhiskiesWith "reference" else pure []
  let ws = map snd wsP
      refs = map snd refsP
  let issues = validate (ws <> refs)
  unless (null issues) $ do
    putStrLn ("Validation warnings (" <> show (length issues) <> "):")
    mapM_ (T.putStrLn . ("  - " <>)) issues
  missingJournals <- filterM (fmap not . doesFileExist . Text.unpack . snd)
    [ (w.name, j) | w <- ws <> refs, Just t <- [w.tasting], Just j <- [t.journal] ]
  let errors =
        validateFiles (wsP <> refsP)
          <> validateReference refs
          <> [ n <> ": journal file " <> j <> " does not exist"
             | (n, j) <- missingJournals ]
  unless (null errors) $ do
    putStrLn ("Errors (" <> show (length errors) <> "):")
    mapM_ (T.putStrLn . ("  - " <>)) errors
    exitFailure
  createDirectoryIfMissing True "docs"
  T.writeFile "README.md" (renderReadme ws)
  T.writeFile "docs/collection.md" (renderCollection ws)
  T.writeFile "docs/wishlist.md" (renderWishlist ws)
  T.writeFile "docs/recommendations.md" (renderRecommendations ws)
  putStrLn ("Generated README.md + docs/ from " <> show (length ws) <> " whiskies ("
            <> show (length refs) <> " reference entries checked).")
