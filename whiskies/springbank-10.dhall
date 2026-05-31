let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "springbank-10",
      name = "Springbank 10",
      producer = P.springbank,
      style = W.Style.SingleMalt,
      abv = 46.0,
      age = Some 10,
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Medium,
        price = { amount = 90, currency = W.Currency.Eur },
        market = W.Market.NlEu,
        claudePick = True,
        tryFirst = True,
        why = "The Campbeltown icon — oily, briny, dunnage funk. Allocated, so taste before chasing a bottle."
      },
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Splurge,
        theme = W.Theme.CampbeltownMalts,
        findability = W.Findability.Red,
        note = "The icon — briny, oily, dunnage funk. Allocated, grab on sight."
      }
    }
