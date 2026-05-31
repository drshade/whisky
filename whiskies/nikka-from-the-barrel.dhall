let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "nikka-from-the-barrel",
      name = "Nikka From The Barrel",
      producer = P.nikka,
      style = W.Style.Blend,
      abv = 51.4,
      wishlist = Some W.Wishlist::{
        priority = W.Priority.High,
        price = { amount = 55, currency = W.Currency.Eur },
        market = W.Market.NlEu,
        claudePick = True,
        why = "Opens Japan — intense, spicy, layered at 51.4%. Strength that earns its complexity."
      },
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Benchmark,
        theme = W.Theme.JapaneseWhisky,
        findability = W.Findability.Amber,
        note = "Ridiculous value; intense, spicy, full. The one to start on."
      }
    }
