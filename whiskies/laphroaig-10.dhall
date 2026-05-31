let W = ../schema/Whisky.dhall

in  W.Whisky::{
      id = "laphroaig-10",
      name = "Laphroaig 10",
      classification = W.scotchSingleMalt W.ScotchDistillery.Laphroaig,
      abv = 40.0,
      age = Some 10,
      casks = [ "peat" ],
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Entry,
        styleGroup = "Classic Islay",
        findability = W.Findability.Green,
        note = "Iodine, seaweed, TCP — love-it-or-hate-it Islay."
      }
    }
