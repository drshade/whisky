let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "michters-rye",
      name = "Michter's US*1 Single Barrel Rye",
      producer = P.michters,
      style = W.Style.Rye,
      abv = 42.4,
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Entry,
        theme = W.Theme.RyeWhiskey,
        findability = W.Findability.Green,
        note = "Refined, rounded, very approachable."
      }
    }
