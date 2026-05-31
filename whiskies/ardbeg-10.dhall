let W = ../schema/Whisky.dhall

in  W.Whisky::{
      id = "ardbeg-10",
      name = "Ardbeg 10",
      classification = W.scotchSingleMalt W.ScotchDistillery.Ardbeg,
      abv = 46.0,
      age = Some 10,
      casks = [ "peat" ],
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Benchmark,
        styleGroup = "Classic Islay",
        findability = W.Findability.Green,
        note = "Bright, medicinal, intense peat."
      }
    }
