let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "compass-box-crimson-casks",
      name = "Crimson Casks",
      producer = P.compassBox,
      style = W.Style.BlendedMalt,
      abv = 46.0,
      ownership = Some W.Ownership::{
        status = W.Status.Sealed,
        boughtWhere = Some "Work trip, May 2026"
      }
    }
