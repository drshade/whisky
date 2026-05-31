let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "hibiki-harmony",
      name = "Hibiki Harmony",
      producer = P.suntory,
      style = W.Style.Blend,
      abv = 43.0,
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Medium,
        estPrice = "~€80",
        market = W.Market.NlEu,
        claudePick = True,
        tryFirst = True,
        why = "Attainable Japanese blend. (Hakushu 12 is the malt benchmark but usually > budget.) Taste before chasing."
      }
    }
