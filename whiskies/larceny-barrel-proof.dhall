let W = ../schema/Whisky.dhall

in  W.Whisky::{
      id = "larceny-barrel-proof",
      name = "Larceny Barrel Proof",
      classification = W.american
        { producer = W.AmericanProducer.HeavenHill,
          mash = W.MashType.Wheat,
          bottledInBond = False,
          singleBarrel = False
        },
      abv = 62.0,
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Medium,
        estPrice = "~€90",
        market = "NL/EU",
        claudePick = True,
        why = "Wheated barrel-proof — sweeter + strong + layered (all my levers). Allocated/pricey but gettable via EU specialists."
      }
    }
