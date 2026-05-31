module Main where

import qualified Data.Text.IO as T
import           System.Directory (createDirectoryIfMissing)
import           Whisky.Load (loadWhiskies)
import           Whisky.Render
                   (renderCollection, renderReadme, renderRecommendations, renderWishlist, validate)

-- | Regenerate the catalogue markdown from the Dhall data. Run from the repo root.
--   README.md stays at the root (it's the GitHub landing dashboard); the detailed
--   tables are written into docs/.
main :: IO ()
main = do
  ws <- loadWhiskies "whiskies"
  let issues = validate ws
  unless (null issues) $ do
    putStrLn ("Validation warnings (" <> show (length issues) <> "):")
    mapM_ (T.putStrLn . ("  - " <>)) issues
  createDirectoryIfMissing True "docs"
  T.writeFile "README.md" (renderReadme ws)
  T.writeFile "docs/collection.md" (renderCollection ws)
  T.writeFile "docs/wishlist.md" (renderWishlist ws)
  T.writeFile "docs/recommendations.md" (renderRecommendations ws)
  putStrLn ("Generated README.md + docs/ from " <> show (length ws) <> " whiskies.")
