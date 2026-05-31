let W = ../schema/Whisky.dhall

in  W.Whisky::{
      id = "octomore",
      name = "Octomore",
      classification = W.scotchSingleMalt W.ScotchDistillery.Bruichladdich,
      abv = 59.0,
      casks = [ "heavy peat" ],
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Low,
        estPrice = "~R3000+",
        market = "NL/EU",
        claudePick = True,
        tryFirst = True,
        why = "Most heavily-peated whisky made — a complexity and intensity experiment. Taste-only at this price."
      }
    }
