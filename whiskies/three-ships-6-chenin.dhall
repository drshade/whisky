let W = ../schema/Whisky.dhall

in  W.Whisky::{
      id = "three-ships-6-chenin",
      name = "Three Ships 6 Chenin",
      classification = W.world
        { country = W.WorldCountry.SouthAfrica,
          producer = "James Sedgwick",
          style = "Single malt"
        },
      abv = 43.0,
      age = Some 6,
      casks = [ "chenin blanc finish" ],
      ownership = Some W.Ownership::{
        status = W.Status.Sealed,
        paid = Some "R699",
        boughtWhere = Some "JHB trip, May 2026"
      }
    }
