let W = ../schema/Whisky.dhall

in  W.Whisky::{
      id = "wild-turkey-rare-breed",
      name = "Wild Turkey Rare Breed",
      classification = W.american
        { producer = W.AmericanProducer.WildTurkey,
          mash = W.MashType.Bourbon,
          bottledInBond = False,
          singleBarrel = False
        },
      abv = 58.4,
      wishlist = Some W.Wishlist::{
        priority = W.Priority.High,
        estPrice = "~€50",
        market = "NL/EU",
        claudePick = True,
        why = "The easy, available complex-bourbon buy in NL/EU — barrel-strength, rich, great value. Best first answer to my 'complex bourbon' gap."
      }
    }
