let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "rittenhouse-rye",
      name = "Rittenhouse Rye BiB",
      producer = P.heavenHill,
      style = W.Style.Rye,
      abv = 50.0,
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Medium,
        estPrice = "~R500",
        market = W.Market.NlEu,
        claudePick = True,
        why = "Opens rye — spicy, drier counterpoint to my bourbons. Cheap style test."
      },
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Benchmark,
        theme = W.Theme.RyeWhiskey,
        findability = W.Findability.Amber,
        note = "The value benchmark — bold, baking-spice, brilliant in a cocktail or neat."
      }
    }
