let W = ../schema/Whisky.dhall

let P = ../schema/producers.dhall

in  W.Whisky::{
      id = "whistlepig-10",
      name = "WhistlePig 10",
      producer = P.whistlePig,
      style = W.Style.Rye,
      abv = 50.0,
      age = Some 10,
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Splurge,
        styleGroup = "Rye",
        findability = W.Findability.Amber,
        note = "100% rye, polished and premium."
      }
    }
