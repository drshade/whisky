let W = ../schema/Whisky.dhall

in  W.Whisky::{
      id = "compass-box-crimson-casks",
      name = "Crimson Casks",
      classification = W.scotchBlendedMalt W.ScotchBlender.CompassBox,
      abv = 46.0,
      ownership = Some W.Ownership::{
        status = W.Status.Sealed,
        boughtWhere = Some "Work trip, May 2026"
      }
    }
