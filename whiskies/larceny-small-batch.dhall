let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "larceny-small-batch",
      name = "Larceny Small Batch",
      producer = P.heavenHill,
      style = W.Style.Wheated,
      abv = 46.0,
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Benchmark,
        theme = W.Theme.WheatedBourbon,
        findability = W.Findability.Amber,
        note = "More of the same as Maker's, a touch richer; great value."
      }
    }
