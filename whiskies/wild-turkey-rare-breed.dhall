let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "wild-turkey-rare-breed",
      name = "Wild Turkey Rare Breed",
      producer = P.wildTurkey,
      style = W.Style.Bourbon,
      abv = 58.4,
      wishlist = Some W.Wishlist::{
        priority = W.Priority.High,
        price = { amount = 50, currency = W.Currency.Eur },
        market = W.Market.NlEu,
        claudePick = True,
        why = "The easy, available complex-bourbon buy in NL/EU — barrel-strength, rich, great value. Best first answer to my 'complex bourbon' gap."
      }
    }
