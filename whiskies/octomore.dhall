let W = ../schema/Whisky.dhall

let P = ../schema/producers.dhall

in  W.Whisky::{
      id = "octomore",
      name = "Octomore",
      producer = P.bruichladdich,
      style = W.Style.SingleMalt,
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
