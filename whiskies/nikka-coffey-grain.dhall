let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "nikka-coffey-grain",
      name = "Nikka Coffey Grain",
      producer = P.nikka,
      style = W.Style.SingleGrain,
      abv = 45.0,
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Entry,
        theme = W.Theme.JapaneseWhisky,
        findability = W.Findability.Amber,
        note = "Lush grain whisky — a natural step from your love of Hedonism."
      }
    }
