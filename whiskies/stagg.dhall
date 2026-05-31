let W = ../schema/Whisky.dhall

in  W.Whisky::{
      id = "stagg",
      name = "Stagg",
      classification = W.american
        { producer = W.AmericanProducer.BuffaloTrace,
          mash = W.MashType.Bourbon,
          bottledInBond = False,
          singleBarrel = False
        },
      abv = 65.0,
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Low,
        estPrice = "~€80+",
        market = "NL/EU",
        claudePick = True,
        why = "Barrel-proof intensity & complexity (ex-'Stagg Jr', NOT George T. Stagg). Allocated/pricey even in EU — a grab-on-sight, not a planned buy."
      }
    }
