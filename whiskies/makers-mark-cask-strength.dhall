let W = ../schema/Whisky.dhall

in  W.Whisky::{
      id = "makers-mark-cask-strength",
      name = "Maker's Mark Cask Strength",
      classification = W.american
        { producer = W.AmericanProducer.MakersMark,
          mash = W.MashType.Wheat,
          bottledInBond = False,
          singleBarrel = False
        },
      abv = 55.0,
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Splurge,
        styleGroup = "Wheated bourbon",
        findability = W.Findability.Red,
        note = "Wheated, full-power. (Weller is the allocated alternative.)"
      }
    }
