let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "three-ships-6-chenin",
      name = "Three Ships 6 Chenin",
      producer = P.jamesSedgwick,
      style = W.Style.SingleMalt,
      abv = 43.0,
      age = Some 6,
      casks = [ "chenin blanc finish" ],
      ownership = Some W.Ownership::{
        status = W.Status.Sealed,
        paid = Some "R699",
        boughtWhere = Some "JHB trip, May 2026"
      }
    }
