module Main where

import qualified Data.Text.IO as T
import           Whisky.Load (loadWhiskies)
import           Whisky.Render (renderCollection, renderReadme, renderRecommendations, renderWishlist)

-- | Regenerate the catalogue markdown from the Dhall data. Run from the repo root.
main :: IO ()
main = do
  ws <- loadWhiskies "whiskies"
  T.writeFile "README.md" (renderReadme ws)
  T.writeFile "collection.md" (renderCollection ws)
  T.writeFile "wishlist.md" (renderWishlist ws)
  T.writeFile "recommendations.md" (renderRecommendations ws)
  putStrLn ("Generated 4 docs from " <> show (length ws) <> " whiskies.")
