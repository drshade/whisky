let W = ../schema/Whisky.dhall

in  W.Whisky::{
      id = "ardbeg-uigeadail",
      name = "Ardbeg Uigeadail",
      classification = W.scotchSingleMalt W.ScotchDistillery.Ardbeg,
      abv = 54.2,
      casks = [ "peat", "oloroso sherry" ],
      ownership = Some W.Ownership::{
        status = W.Status.Sealed,
        paid = Some "~R1300",
        boughtWhere = Some "JHB trip, May 2026"
      }
    }
