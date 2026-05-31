let W = ../schema/Whisky.dhall

let P = ../schema/producers.dhall

in  W.Whisky::{
      id = "jameson-black-barrel",
      name = "Jameson Black Barrel",
      producer = P.midleton,
      style = W.Style.Blend,
      abv = 40.0,
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Entry,
        styleGroup = "Irish — single pot still",
        findability = W.Findability.Green,
        note = "Easy, rich entry into the Irish idea."
      }
    }
