module Main where

import qualified Data.Text.IO as T
import           Whisky.Load (loadWhiskies)
import           Whisky.Render (renderCollection, renderReadme)

-- | Regenerate the catalogue markdown from the Dhall data. Run from the repo root.
main :: IO ()
main = do
  ws <- loadWhiskies "whiskies"
  T.writeFile "README.md" (renderReadme ws)
  T.writeFile "collection.md" (renderCollection ws)
  putStrLn ("Generated README.md and collection.md from " <> show (length ws) <> " whiskies.")
