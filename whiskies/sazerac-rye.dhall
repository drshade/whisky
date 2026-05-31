let W = ../schema/Whisky.dhall

let P = ../schema/producers.dhall

in  W.Whisky::{
      id = "sazerac-rye",
      name = "Sazerac Rye",
      producer = P.buffaloTrace,
      style = W.Style.Rye,
      abv = 45.0,
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Entry,
        styleGroup = "Rye",
        findability = W.Findability.Amber,
        note = "Softer, sweeter 'New Orleans' rye; easy entry."
      }
    }
