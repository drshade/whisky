let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "kilkerran-12",
      name = "Kilkerran 12",
      producer = P.glengyle,
      style = W.Style.SingleMalt,
      abv = 46.0,
      age = Some 12,
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Medium,
        price = { amount = 60, currency = W.Currency.Eur },
        market = W.Market.NlEu,
        claudePick = True,
        why = "Opens Campbeltown — oily, fruity, light smoke, loads of character."
      },
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Benchmark,
        theme = W.Theme.CampbeltownMalts,
        findability = W.Findability.Amber,
        note = "Superb balance of fruit, oil and light smoke."
      }
    }
