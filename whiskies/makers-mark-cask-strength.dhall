let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "makers-mark-cask-strength",
      name = "Maker's Mark Cask Strength",
      producer = P.makersMark,
      style = W.Style.Wheated,
      abv = 55.0,
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Splurge,
        theme = W.Theme.WheatedBourbon,
        findability = W.Findability.Red,
        note = "Wheated, full-power. (Weller is the allocated alternative.)"
      }
    }
