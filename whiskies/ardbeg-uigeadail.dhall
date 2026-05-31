let W = ../schema/Whisky.dhall

let P = ../schema/producers.dhall

in  W.Whisky::{
      id = "ardbeg-uigeadail",
      name = "Ardbeg Uigeadail",
      producer = P.ardbeg,
      style = W.Style.SingleMalt,
      abv = 54.2,
      casks = [ "peat", "oloroso sherry" ],
      ownership = Some W.Ownership::{
        status = W.Status.Sealed,
        paid = Some "~R1300",
        boughtWhere = Some "JHB trip, May 2026"
      }
    }
