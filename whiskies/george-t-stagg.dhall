let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "george-t-stagg",
      name = "George T. Stagg",
      producer = P.buffaloTrace,
      style = W.Style.Bourbon,
      abv = 65.0,
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Low,
        price = { amount = 600, currency = W.Currency.Eur },
        market = W.Market.NlEu,
        claudePick = True,
        tryFirst = True,
        why = "The unicorn. Taste it if a bottle's open — you'll never buy one."
      }
    }
