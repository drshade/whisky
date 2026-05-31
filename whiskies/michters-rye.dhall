let W = ../schema/Whisky.dhall

let P = ../producers.dhall

in  W.Whisky::{
      id = "michters-rye",
      name = "Michter's US*1 Single Barrel Rye",
      producer = P.michters,
      style = W.Style.Rye,
      abv = 42.4,
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Entry,
        styleGroup = "Rye",
        findability = W.Findability.Green,
        note = "Refined, rounded, very approachable."
      }
    }
