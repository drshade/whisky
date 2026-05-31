let W = ../schema/Whisky.dhall

in  W.Whisky::{
      id = "larceny-small-batch",
      name = "Larceny Small Batch",
      classification = W.american
        { producer = W.AmericanProducer.HeavenHill,
          mash = W.MashType.Wheat,
          bottledInBond = False,
          singleBarrel = False
        },
      abv = 46.0,
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Benchmark,
        styleGroup = "Wheated bourbon",
        findability = W.Findability.Amber,
        note = "More of the same as Maker's, a touch richer; great value."
      }
    }
