let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "ardbeg-10",
      name = "Ardbeg 10",
      producer = P.ardbeg,
      style = W.Style.SingleMalt,
      abv = 46.0,
      age = Some 10,
      casks = [ "peat" ],
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Benchmark,
        theme = W.Theme.ClassicIslay,
        findability = W.Findability.Green,
        note = "Bright, medicinal, intense peat."
      }
    }
