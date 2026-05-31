let W = ../schema/Whisky.dhall

in  W.Whisky::{
      id = "makers-mark",
      name = "Maker's Mark",
      classification = W.american
        { producer = W.AmericanProducer.MakersMark,
          mash = W.MashType.Wheat,
          bottledInBond = False,
          singleBarrel = False
        },
      abv = 45.0,
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Entry,
        styleGroup = "Wheated bourbon",
        findability = W.Findability.Green,
        note = "The accessible wheated benchmark."
      }
    }
