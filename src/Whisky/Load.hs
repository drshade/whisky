-- | Load every @whiskies/*.dhall@ file into typed 'Whisky' values.
--   Decoding failure (a file that drifts from the schema) throws here, so the
--   generator fails loudly rather than emitting wrong markdown.
module Whisky.Load
  ( loadWhiskies
  ) where

import           Dhall (auto, inputFile)
import           System.Directory (listDirectory)
import           System.FilePath (takeExtension, (</>))
import           Whisky.Types (Whisky)

-- | Decode all bottles in @dir@ (e.g. @"whiskies"@), sorted by filename for
--   deterministic output. Imports inside each file (the schema) resolve
--   relative to the file, so this works from any CWD.
loadWhiskies :: FilePath -> IO [Whisky]
loadWhiskies dir = do
  files <- sort . filter ((== ".dhall") . takeExtension) <$> listDirectory dir
  traverse (\f -> inputFile auto (dir </> f)) files
