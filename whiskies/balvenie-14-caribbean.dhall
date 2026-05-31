let W = ../schema/Whisky.dhall

let P = ../producers.dhall

in  W.Whisky::{
      id = "balvenie-14-caribbean",
      name = "Balvenie 14 Caribbean Cask",
      producer = P.balvenie,
      style = W.Style.SingleMalt,
      abv = 43.0,
      age = Some 14,
      casks = [ "rum finish" ],
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Splurge,
        styleGroup = "Speyside — bright & ex-bourbon",
        findability = W.Findability.Green,
        note = "Honeyed malt with a rum-cask twist."
      }
    }
