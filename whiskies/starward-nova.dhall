let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "starward-nova",
      name = "Starward Nova",
      producer = P.starward,
      style = W.Style.SingleMalt,
      abv = 41.0,
      casks = [ "red wine" ],
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Entry,
        styleGroup = "Other world whisky",
        findability = W.Findability.Amber,
        note = "Red-wine-cask matured; juicy, approachable."
      }
    }
