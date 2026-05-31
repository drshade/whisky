let W = ../schema/Whisky.dhall

in  W.Whisky::{
      id = "rittenhouse-rye",
      name = "Rittenhouse Rye BiB",
      classification = W.american
        { producer = W.AmericanProducer.HeavenHill,
          mash = W.MashType.Rye,
          bottledInBond = True,
          singleBarrel = False
        },
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
