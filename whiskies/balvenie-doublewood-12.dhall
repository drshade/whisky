let W = ../schema/Whisky.dhall

in  W.Whisky::{
      id = "balvenie-doublewood-12",
      name = "Balvenie DoubleWood 12",
      classification = W.scotchSingleMalt W.ScotchDistillery.Balvenie,
      abv = 40.0,
      age = Some 12,
      casks = [ "sherry finish" ],
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Medium,
        estPrice = "~€60",
        market = "NL/EU",
        claudePick = True,
        why = "Honeyed, sherry-finished, well-rounded — a characterful mainstream pick that suits me."
      }
    }
