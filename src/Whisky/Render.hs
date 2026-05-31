-- | Render the markdown views from the decoded whisky data. Every function here
--   is a pure @[Whisky] -> Text@; @Main@ writes the results to disk. These outputs
--   are generated artefacts — the Dhall files are the source of truth.
module Whisky.Render
  ( renderReadme
  , renderCollection
  , renderWishlist
  , renderRecommendations
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
    , "## Next buys (high priority)"
    , ""
    , nextBuys ws
    , ""
    , "## More"
    , ""
    , "[`collection.md`](collection.md) · [`wishlist.md`](wishlist.md) · "
        <> "[`recommendations.md`](recommendations.md) · [`preferences.md`](preferences.md) · "
        <> "[`goals.md`](goals.md) · [`journal/`](journal/)"
    , ""
    , "_Data lives in `whiskies/*.dhall`; run `cabal run whisky-catalogue` to regenerate._"
    ]

-- | High-priority buy targets (excludes taste-first), as a short bullet list.
nextBuys :: [Whisky] -> Text
nextBuys ws =
  let picks =
        [ w
        | w <- ws
        , Just wl <- [w.wishlist]
        , wl.priority == PrHigh
        , not wl.tryFirst
        ]
  in case picks of
       [] -> "_None right now._"
       _ -> T.intercalate "\n"
              [ "- **" <> w.name <> "** (" <> regionLabel w.classification <> ") — "
                  <> maybe "" (.estPrice) w.wishlist
              | w <- picks ]

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

-- ============================================================================
-- wishlist.md
-- ============================================================================

priorityRank :: Priority -> Int
priorityRank = \case PrHigh -> 0; PrMedium -> 1; PrLow -> 2

priorityLabel :: Priority -> Text
priorityLabel = \case PrHigh -> "high"; PrMedium -> "medium"; PrLow -> "low"

renderWishlist :: [Whisky] -> Text
renderWishlist ws =
  let wls = filter (isJust . (.wishlist)) ws
      buy = sortOn wlRank (filter (not . wlTryFirst) wls)
      try = sortOn wlRank (filter wlTryFirst wls)
  in T.intercalate "\n"
       [ "# Wishlist"
       , ""
       , "> Whiskies to buy or try. **Generated from `whiskies/*.dhall` — do not edit by hand.**"
       , "> Priority: high · medium · low. 💡 = Claude pick."
       , ""
       , "## Buy targets"
       , ""
       , wlTable buy
       , "## Try first (taste before buying)"
       , ""
       , wlTable try
       ]
  where
    wlRank w = maybe 9 (priorityRank . (.priority)) w.wishlist
    wlTryFirst w = maybe False (.tryFirst) w.wishlist
    wlTable rows = table ["Bottle", "Region", "Type", "Priority", "~Price", "Why"] (map wlRow rows)
    wlRow w =
      let wl = w.wishlist
      in [ maybe w.name (\x -> if x.claudePick then "💡 " <> w.name else w.name) wl
         , regionLabel w.classification
         , typeLabel w.classification
         , maybe "" (priorityLabel . (.priority)) wl
         , maybe "" (.estPrice) wl
         , maybe "" (.why) wl
         ]

-- ============================================================================
-- recommendations.md
-- ============================================================================

tierRank :: Tier -> Int
tierRank = \case Entry -> 0; Benchmark -> 1; Splurge -> 2

tierLabel :: Tier -> Text
tierLabel = \case Entry -> "Entry"; Benchmark -> "Benchmark"; Splurge -> "Splurge"

findabilitySymbol :: Findability -> Text
findabilitySymbol = \case Green -> "🟢"; Amber -> "🟡"; Red -> "🔴"

-- | The order style groups appear in. Groups not listed are appended alphabetically.
styleOrder :: [Text]
styleOrder =
  [ "Rye", "Irish — single pot still", "Campbeltown", "Japanese"
  , "Speyside — bright & ex-bourbon", "Other world whisky", "Wheated bourbon", "Classic Islay" ]

renderRecommendations :: [Whisky] -> Text
renderRecommendations ws =
  let recs = filter (isJust . (.recommendation)) ws
      groupsPresent = foldr (\w acc -> let g = groupOf w in if g `elem` acc then acc else acc <> [g]) [] recs
      ordered = filter (`elem` groupsPresent) styleOrder
                  <> filter (`notElem` styleOrder) groupsPresent
  in T.intercalate "\n"
       ( [ "# Recommendations — Regions & Styles to Explore"
         , ""
         , "> A curated map of territory to explore, by style. **Generated from `whiskies/*.dhall`"
         , "> — do not edit by hand.** Tiers: Entry · Benchmark · Splurge. Find: 🟢 widely stocked ·"
         , "> 🟡 around if you look · 🔴 scarce / allocated."
         , ""
         ] <> map (renderGroup recs) ordered )
  where
    groupOf w = maybe "" (.styleGroup) w.recommendation
    renderGroup rs g =
      let inGroup = sortOn (maybe 9 (tierRank . (.tier)) . (.recommendation))
                      (filter ((== g) . groupOf) rs)
      in "## " <> g <> "\n\n" <> table ["Bottle", "ABV", "Note", "Tier", "Find"] (map recRow inGroup)
    recRow w =
      let r = w.recommendation
      in [ w.name
         , showAbv w.abv
         , maybe "" (.note) r
         , maybe "" (tierLabel . (.tier)) r
         , maybe "" (findabilitySymbol . (.findability)) r
         ]
