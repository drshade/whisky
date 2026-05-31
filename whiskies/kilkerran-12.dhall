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
        estPrice = "~R1200",
        market = W.Market.NlEu,
        claudePick = True,
        why = "Opens Campbeltown — oily, fruity, light smoke, loads of character."
      },
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Benchmark,
        styleGroup = "Campbeltown",
        findability = W.Findability.Amber,
        note = "Superb balance of fruit, oil and light smoke."
      }
    }
