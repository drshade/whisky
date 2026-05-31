let W = ../schema/Whisky.dhall

in  W.Whisky::{
      id = "george-t-stagg",
      name = "George T. Stagg",
      classification = W.american
        { producer = W.AmericanProducer.BuffaloTrace,
          mash = W.MashType.Bourbon,
          bottledInBond = False,
          singleBarrel = False
        },
      abv = 65.0,
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Low,
        estPrice = "~R5000+",
        market = "NL/EU",
        claudePick = True,
        tryFirst = True,
        why = "The unicorn. Taste it if a bottle's open — you'll never buy one."
      }
    }
