-- | Render the markdown views from the decoded whisky data. Every function here
--   is a pure @[Whisky] -> Text@; @Main@ writes the results to disk. These outputs
--   are generated artefacts — the Dhall files are the source of truth.
module Whisky.Render
  ( renderReadme
  , renderCollection
  ) where

import qualified Data.Text as T
import           Whisky.Types

-- ============================================================================
-- Small helpers
-- ============================================================================

ratingMay :: Whisky -> Maybe Natural
ratingMay w = fmap (.rating) w.tasting

isOwned :: Whisky -> Bool
isOwned w = isJust w.ownership

isTasted :: Whisky -> Bool
isTasted w = isJust w.tasting

-- | Rating cell with a @*@ suffix for low-confidence scores.
ratingCell :: Whisky -> Text
ratingCell w = case w.tasting of
  Nothing -> "—"
  Just t -> T.pack (show t.rating) <> if t.confidence == Low then "*" else ""

showAbv :: Double -> Text
showAbv x =
  let r = round x :: Int
  in (if x == fromIntegral r then T.pack (show r) else T.pack (show x)) <> "%"

showAge :: Maybe Natural -> Text
showAge = maybe "NAS" (T.pack . show)

statusLabel :: Status -> Text
statusLabel = \case
  Sealed -> "sealed"
  Open -> "open"
  Finished -> "finished"

journalLink :: Whisky -> Text
journalLink w = case w.tasting >>= (.journal) of
  Just path -> "[notes](" <> path <> ")"
  Nothing -> ""

-- | A markdown table from a header and rows (cells already rendered).
table :: [Text] -> [[Text]] -> Text
table header rows =
  T.unlines (row header : sep : map row rows)
  where
    row cells = "| " <> T.intercalate " | " cells <> " |"
    sep = "|" <> T.intercalate "|" (map (const "---") header) <> "|"

-- | Count occurrences, preserving first-seen order of keys.
tally :: [Text] -> [(Text, Int)]
tally = foldl' bump []
  where
    bump acc k = case lookup k acc of
      Just _ -> map (\(k', n') -> if k' == k then (k', n' + 1) else (k', n')) acc
      Nothing -> acc <> [(k, 1)]

renderTally :: [(Text, Int)] -> Text
renderTally = T.intercalate " · " . map (\(k, n) -> T.pack (show n) <> " " <> k)

-- ============================================================================
-- README
-- ============================================================================

renderReadme :: [Whisky] -> Text
renderReadme ws =
  T.intercalate "\n"
    [ "# 🥃 Whisky Collection"
    , ""
    , "> At-a-glance dashboard. **Generated from `whiskies/*.dhall` — do not edit by hand.**"
    , "> Run `cabal run whisky-catalogue` to regenerate after changing the data."
    , ""
    , "## Stats"
    , ""
    , statsBlock ws
    , ""
    , "## Ranked collection"
    , ""
    , rankedTable ws
    , "## Tasting log — everything tasted"
    , ""
    , "All whiskies actually tasted (owned + sampled), best to worst. `(s)` = sampled,"
    , "not owned · `*` = low-confidence rating."
    , ""
    , tastingLog ws
    ]

statsBlock :: [Whisky] -> Text
statsBlock ws =
  let owned = filter isOwned ws
      openN = length (filter (ownedStatus Open) owned)
      sealedN = length (filter (ownedStatus Sealed) owned)
      tastedN = length (filter isTasted owned)
      byStyle = renderTally (tally (map (typeLabel . (.classification)) owned))
      byRegion = renderTally (tally (map (regionLabel . (.classification)) owned))
  in T.intercalate "\n"
       [ "- **Owned:** " <> T.pack (show (length owned)) <> " bottles — "
           <> T.pack (show openN) <> " open, " <> T.pack (show sealedN) <> " sealed"
       , "- **By style:** " <> byStyle
       , "- **By region:** " <> byRegion
       , "- **Tasted & rated:** " <> T.pack (show tastedN) <> " / " <> T.pack (show (length owned))
       ]
  where
    ownedStatus s w = fmap (.status) w.ownership == Just s

-- | Owned + tasted, ranked by rating (ties share a rank); sealed listed after.
rankedTable :: [Whisky] -> Text
rankedTable ws =
  let tasted = sortOn (Down . ratingMay) (filter (\w -> isOwned w && isTasted w) ws)
      sealed = filter (\w -> isOwned w && not (isTasted w)) ws
      rankOf w = 1 + length (filter (\x -> ratingMay x > ratingMay w) tasted)
      tastedRows = map (\w -> [T.pack (show (rankOf w)), nameCell w, regionLabel w.classification, ratingCell w, summaryOf w]) tasted
      sealedRows = map (\w -> ["—", nameCell w, regionLabel w.classification, "_sealed_", "not yet tasted"]) sealed
  in table ["#", "Bottle", "Region", "Rating", "In a word"] (tastedRows <> sealedRows)
  where
    summaryOf w = maybe "" (.summary) w.tasting
    nameCell w = case w.tasting >>= (.journal) of
      Just path -> "[" <> w.name <> "](" <> path <> ")"
      Nothing -> w.name

tastingLog :: [Whisky] -> Text
tastingLog ws =
  let tasted = sortOn (Down . ratingMay) (filter isTasted ws)
      rows = map (\w -> [nameCell w, ratingCell w, maybe "" (.summary) w.tasting]) tasted
  in table ["Bottle", "Rating", "Notes"] rows
  where
    nameCell w = w.name <> if isOwned w then "" else " `(s)`"

-- ============================================================================
-- collection.md
-- ============================================================================

renderCollection :: [Whisky] -> Text
renderCollection ws =
  let owned = filter isOwned ws
      rows = map ownedRow owned
  in T.intercalate "\n"
       [ "# Collection"
       , ""
       , "> What I currently own. **Generated from `whiskies/*.dhall` — do not edit by hand.**"
       , ""
       , table
           ["Bottle", "Distillery", "Region", "Type", "ABV", "Age", "Status", "Paid", "Bought", "Rating", "Journal"]
           rows
       , "## Summary"
       , ""
       , statsBlock owned
       ]
  where
    ownedRow w =
      let own = w.ownership
      in [ w.name
         , producerName w.classification
         , regionLabel w.classification
         , typeLabel w.classification
         , showAbv w.abv
         , showAge w.age
         , maybe "" (statusLabel . (.status)) own
         , maybe "" (fromMaybe "" . (.paid)) own
         , maybe "" (fromMaybe "" . (.boughtWhere)) own
         , ratingCell w
         , journalLink w
         ]
