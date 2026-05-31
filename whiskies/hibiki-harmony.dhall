let W = ../schema/Whisky.dhall

in  W.Whisky::{
      id = "hibiki-harmony",
      name = "Hibiki Harmony",
      classification = W.japanese
        { producer = W.JapaneseProducer.Suntory, style = W.JapaneseStyle.Blend },
      abv = 43.0,
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Medium,
        estPrice = "~€80",
        market = "NL/EU",
        claudePick = True,
        tryFirst = True,
        why = "Attainable Japanese blend. (Hakushu 12 is the malt benchmark but usually > budget.) Taste before chasing."
      }
    }
