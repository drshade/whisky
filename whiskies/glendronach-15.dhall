let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "glendronach-15",
      name = "GlenDronach 15 Revival",
      producer = P.glendronach,
      style = W.Style.SingleMalt,
      abv = 46.0,
      age = Some 15,
      casks = [ "sherry" ],
      wishlist = Some W.Wishlist::{
        priority = W.Priority.High,
        price = { amount = 90, currency = W.Currency.Eur },
        market = W.Market.NlEu,
        claudePick = True,
        why = "Deep dried-fruit sherry; sweetness + complexity bullseye."
      }
    }
