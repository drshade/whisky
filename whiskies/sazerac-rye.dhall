let W = ../schema/Whisky.dhall

in  W.Whisky::{
      id = "sazerac-rye",
      name = "Sazerac Rye",
      classification = W.american
        { producer = W.AmericanProducer.BuffaloTrace,
          mash = W.MashType.Rye,
          bottledInBond = False,
          singleBarrel = False
        },
      abv = 45.0,
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Entry,
        styleGroup = "Rye",
        findability = W.Findability.Amber,
        note = "Softer, sweeter 'New Orleans' rye; easy entry."
      }
    }
