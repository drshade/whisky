let W = ../schema/Whisky.dhall

in  W.Whisky::{
      id = "whistlepig-10",
      name = "WhistlePig 10",
      classification = W.american
        { producer = W.AmericanProducer.WhistlePig,
          mash = W.MashType.Rye,
          bottledInBond = False,
          singleBarrel = False
        },
      abv = 50.0,
      age = Some 10,
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Splurge,
        styleGroup = "Rye",
        findability = W.Findability.Amber,
        note = "100% rye, polished and premium."
      }
    }
