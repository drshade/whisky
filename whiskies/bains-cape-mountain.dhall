let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "bains-cape-mountain",
      name = "Bain's Cape Mountain",
      producer = P.jamesSedgwick,
      style = W.Style.SingleGrain,
      abv = 43.0,
      tasting = Some W.Tasting::{
        rating = 78,
        confidence = W.Confidence.Normal,
        summary = "very simple but not unpleasant; unexpectedly bourbony (ex-bourbon cask does all the talking); a touch more detail than single-note but ordinary overall",
        journal = Some "journal/2026-06-01-bains-cape-mountain.md"
      },
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Medium,
        price = { amount = 250, currency = W.Currency.Zar },
        market = W.Market.Sa,
        claudePick = True,
        why = "SA-trip buy — award-winning local single grain, great value. But sweet & simple/easy, NOT complex like Hedonism — a cheap low-risk curiosity, not a wow."
      }
    }
