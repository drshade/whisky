let W = ../schema/Whisky.dhall

in  W.Whisky::{
      id = "lagavulin-16",
      name = "Lagavulin 16",
      classification = W.scotchSingleMalt W.ScotchDistillery.Lagavulin,
      abv = 43.0,
      age = Some 16,
      casks = [ "peat" ],
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Benchmark,
        styleGroup = "Classic Islay",
        findability = W.Findability.Green,
        note = "The benchmark — deep, smoky, sweet, iconic."
      }
    }
