let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "makers-mark",
      name = "Maker's Mark",
      producer = P.makersMark,
      style = W.Style.Wheated,
      abv = 45.0,
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Entry,
        styleGroup = "Wheated bourbon",
        findability = W.Findability.Green,
        note = "The accessible wheated benchmark."
      }
    }
