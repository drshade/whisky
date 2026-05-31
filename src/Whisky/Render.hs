-- | Render the markdown views from the decoded whisky data. Every function here
--   is a pure @[Whisky] -> Text@; @Main@ writes the results to disk. These outputs
--   are generated artefacts — the Dhall files are the source of truth.
module Whisky.Render
  ( renderReadme
  , renderCollection
  , renderWishlist
  , renderRecommendations
  , validate
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

-- | Journal link for collection.md, which lives in docs/ — hence the @../@ to
--   reach the root-relative journal path stored in the data.
journalLink :: Whisky -> Text
journalLink w = case w.tasting >>= (.journal) of
  Just path -> "[notes](../" <> path <> ")"
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
    , "[`docs/collection.md`](docs/collection.md) · [`docs/wishlist.md`](docs/wishlist.md) · "
        <> "[`docs/recommendations.md`](docs/recommendations.md) · [`notes/preferences.md`](notes/preferences.md) · "
        <> "[`notes/goals.md`](notes/goals.md) · [`journal/`](journal/)"
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
              [ "- **" <> w.name <> "** (" <> regionLabel w <> ") — "
                  <> maybe "" (priceLabel . (.price)) w.wishlist
              | w <- picks ]

statsBlock :: [Whisky] -> Text
statsBlock ws =
  let owned = filter isOwned ws
      openN = length (filter (ownedStatus Open) owned)
      sealedN = length (filter (ownedStatus Sealed) owned)
      tastedN = length (filter isTasted owned)
      byStyle = renderTally (tally (map (typeLabel) owned))
      byRegion = renderTally (tally (map (regionLabel) owned))
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
      tastedRows = map (\w -> [T.pack (show (rankOf w)), nameCell w, regionLabel w, ratingCell w, summaryOf w]) tasted
      sealedRows = map (\w -> ["—", nameCell w, regionLabel w, "_sealed_", "not yet tasted"]) sealed
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
         , producerName w
         , regionLabel w
         , typeLabel w
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
      tasteFirst = sortOn wlRank (filter wlTryFirst wls)
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
       , wlTable tasteFirst
       ]
  where
    wlRank w = maybe 9 (priorityRank . (.priority)) w.wishlist
    wlTryFirst w = maybe False (.tryFirst) w.wishlist
    wlTable rows = table ["Bottle", "Region", "Type", "Priority", "~Price", "Why"] (map wlRow rows)
    wlRow w =
      let wl = w.wishlist
      in [ maybe w.name (\x -> if x.claudePick then "💡 " <> w.name else w.name) wl
         , regionLabel w
         , typeLabel w
         , maybe "" (priorityLabel . (.priority)) wl
         , maybe "" (priceLabel . (.price)) wl
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

renderRecommendations :: [Whisky] -> Text
renderRecommendations ws =
  let recs = filter (isJust . (.recommendation)) ws
      groups = [ renderGroup rs th
               | th <- [minBound .. maxBound]
               , let rs = filter ((== Just th) . themeOf) recs
               , not (null rs) ]
  in T.intercalate "\n"
       ( [ "# Recommendations — Regions & Styles to Explore"
         , ""
         , "> A curated map of territory to explore, by theme. **Generated from `whiskies/*.dhall`"
         , "> — do not edit by hand.** Tiers: Entry · Benchmark · Splurge. Find: 🟢 widely stocked ·"
         , "> 🟡 around if you look · 🔴 scarce / allocated."
         , ""
         ] <> groups )
  where
    themeOf w = fmap (.theme) w.recommendation
    renderGroup rs th =
      let inGroup = sortOn (maybe 9 (tierRank . (.tier)) . (.recommendation)) rs
      in "## " <> themeLabel th <> "\n\n" <> table ["Bottle", "ABV", "Note", "Tier", "Find"] (map recRow inGroup)
    recRow w =
      let r = w.recommendation
      in [ w.name
         , showAbv w.abv
         , maybe "" (.note) r
         , maybe "" (tierLabel . (.tier)) r
         , maybe "" (findabilitySymbol . (.findability)) r
         ]

-- ============================================================================
-- Build-time validation — producer/style sanity the type system no longer enforces
-- ============================================================================

-- | Flag implausible producer/style/origin combinations. Returns one message per
--   issue (empty = all good). 'Main' prints these; they don't block generation.
validate :: [Whisky] -> [Text]
validate = concatMap checkOne
  where
    checkOne w =
      let sty = w.style
          og = w.producer.origin
          blended = sty `elem` [Blend, BlendedMalt, BlendedGrain]
          usOrigin = og `elem` [Kentucky, Tennessee, Indiana, USA]
      in concat
           [ [ w.name <> ": a blender bottling should be a blend, not " <> styleLabel sty
             | w.producer.kind == Blender, not blended ]
           , [ w.name <> ": " <> styleLabel sty <> " expects a US origin, got " <> originLabel og
             | sty `elem` [Bourbon, Rye, Wheated], not usOrigin ]
           , [ w.name <> ": single pot still expects Ireland, got " <> originLabel og
             | sty == SinglePotStill, og /= Ireland ]
           , [ w.name <> ": " <> marketName wl.market <> " market but price is "
                 <> currencyName wl.price.currency
             | Just wl <- [w.wishlist], not (currencyFitsMarket wl.market wl.price.currency) ]
           ]
    currencyFitsMarket NlEu Eur = True
    currencyFitsMarket Sa Zar = True
    currencyFitsMarket _ _ = False
    marketName = \case NlEu -> "NL/EU"; Sa -> "SA"
    currencyName = \case Eur -> "EUR"; Zar -> "ZAR"
