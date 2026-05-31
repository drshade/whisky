let W = ../schema/Whisky.dhall

let P = ../producers.dhall

in  W.Whisky::{
      id = "nikka-from-the-barrel",
      name = "Nikka From The Barrel",
      producer = P.nikka,
      style = W.Style.Blend,
      abv = 51.4,
      wishlist = Some W.Wishlist::{
        priority = W.Priority.High,
        estPrice = "~R1100",
        market = "NL/EU",
        claudePick = True,
        why = "Opens Japan — intense, spicy, layered at 51.4%. Strength that earns its complexity."
      },
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Benchmark,
        styleGroup = "Japanese",
        findability = W.Findability.Amber,
        note = "Ridiculous value; intense, spicy, full. The one to start on."
      }
    }
