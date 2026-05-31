let W = ../schema/Whisky.dhall

in  W.Whisky::{
      id = "michters-rye",
      name = "Michter's US*1 Single Barrel Rye",
      classification = W.american
        { producer = W.AmericanProducer.Michters,
          mash = W.MashType.Rye,
          bottledInBond = False,
          singleBarrel = True
        },
      abv = 42.4,
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Entry,
        styleGroup = "Rye",
        findability = W.Findability.Green,
        note = "Refined, rounded, very approachable."
      }
    }
