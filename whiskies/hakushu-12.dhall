let W = ../schema/Whisky.dhall

in  W.Whisky::{
      id = "hakushu-12",
      name = "Hakushu 12",
      classification = W.japanese
        { producer = W.JapaneseProducer.Suntory, style = W.JapaneseStyle.SingleMalt },
      abv = 43.0,
      age = Some 12,
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Splurge,
        styleGroup = "Japanese",
        findability = W.Findability.Red,
        note = "Benchmark single malt — beautiful, but pricey & allocated."
      }
    }
