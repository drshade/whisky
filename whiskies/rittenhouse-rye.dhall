let W = ../schema/Whisky.dhall

let P = ../schema/producers.dhall

in  W.Whisky::{
      id = "rittenhouse-rye",
      name = "Rittenhouse Rye BiB",
      producer = P.heavenHill,
      style = W.Style.Rye,
      abv = 50.0,
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Medium,
        estPrice = "~R500",
        market = "NL/EU",
        claudePick = True,
        why = "Opens rye — spicy, drier counterpoint to my bourbons. Cheap style test."
      },
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Benchmark,
        styleGroup = "Rye",
        findability = W.Findability.Amber,
        note = "The value benchmark — bold, baking-spice, brilliant in a cocktail or neat."
      }
    }
