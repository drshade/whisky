module Main where

import qualified Data.Text.IO as T
import           System.Directory (createDirectoryIfMissing, doesDirectoryExist)
import           Whisky.Load (loadWhiskies)
import           Whisky.Render
                   (renderCollection, renderReadme, renderRecommendations, renderWishlist, validate, validateReference)

-- | Regenerate the catalogue markdown from the Dhall data. Run from the repo root.
--   README.md stays at the root (it's the GitHub landing dashboard); the detailed
--   tables are written into docs/.
--
--   Two collections are loaded: @whiskies/@ (bottles with a personal facet —
--   these drive every view) and @reference/@ (facts-only cache of bottles merely
--   known about — validated, queryable in the repl, but rendered nowhere).
main :: IO ()
main = do
  ws <- loadWhiskies "whiskies"
  refs <- do
    hasRef <- doesDirectoryExist "reference"
    if hasRef then loadWhiskies "reference" else pure []
  let issues = validate (ws <> refs)
  unless (null issues) $ do
    putStrLn ("Validation warnings (" <> show (length issues) <> "):")
    mapM_ (T.putStrLn . ("  - " <>)) issues
  let refErrors = validateReference refs
  unless (null refErrors) $ do
    putStrLn ("Reference errors (" <> show (length refErrors) <> "):")
    mapM_ (T.putStrLn . ("  - " <>)) refErrors
    exitFailure
  createDirectoryIfMissing True "docs"
  T.writeFile "README.md" (renderReadme ws)
  T.writeFile "docs/collection.md" (renderCollection ws)
  T.writeFile "docs/wishlist.md" (renderWishlist ws)
  T.writeFile "docs/recommendations.md" (renderRecommendations ws)
  putStrLn ("Generated README.md + docs/ from " <> show (length ws) <> " whiskies ("
            <> show (length refs) <> " reference entries checked).")
