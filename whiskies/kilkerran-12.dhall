let W = ../schema/Whisky.dhall

in  W.Whisky::{
      id = "kilkerran-12",
      name = "Kilkerran 12",
      classification = W.scotchSingleMalt W.ScotchDistillery.Glengyle,
      abv = 46.0,
      age = Some 12,
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Medium,
        estPrice = "~R1200",
        market = "NL/EU",
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
