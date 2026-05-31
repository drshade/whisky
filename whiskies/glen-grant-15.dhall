let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "glen-grant-15",
      name = "Glen Grant 15 Batch Strength",
      producer = P.glenGrant,
      style = W.Style.SingleMalt,
      abv = 50.0,
      age = Some 15,
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Benchmark,
        theme = W.Theme.BrightSpeyside,
        findability = W.Findability.Amber,
        note = "All ex-bourbon, gorgeous fruit, huge value."
      }
    }
