let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "three-ships-10",
      name = "Three Ships 10",
      producer = P.jamesSedgwick,
      style = W.Style.SingleMalt,
      abv = 43.0,
      age = Some 10,
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Medium,
        price = { amount = 500, currency = W.Currency.Zar },
        market = W.Market.Sa,
        claudePick = True,
        why = "The Three Ships single malt actually sold in SA (NGF). If I want a local Three Ships in JHB, this is the one — the 12yo is export-only."
      }
    }
