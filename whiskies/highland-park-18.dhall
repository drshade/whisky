let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "highland-park-18",
      name = "Highland Park 18",
      producer = P.highlandPark,
      style = W.Style.SingleMalt,
      abv = 43.0,
      age = Some 18,
      casks = [ "sherry" ],
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Medium,
        price = { amount = 140, currency = W.Currency.Eur },
        market = W.Market.NlEu,
        claudePick = True,
        tryFirst = True,
        why = "Honey + gentle peat + sherry, beautifully complex — strong fit. But above budget, so taste first; buy if it wows."
      }
    }
