let W = ../schema/Whisky.dhall

let P = ../schema/producers.dhall

in  W.Whisky::{
      id = "hakushu-12",
      name = "Hakushu 12",
      producer = P.suntory,
      style = W.Style.SingleMalt,
      abv = 43.0,
      age = Some 12,
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Splurge,
        styleGroup = "Japanese",
        findability = W.Findability.Red,
        note = "Benchmark single malt — beautiful, but pricey & allocated."
      }
    }
