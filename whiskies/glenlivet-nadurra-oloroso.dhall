let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "glenlivet-nadurra-oloroso",
      name = "Glenlivet Nàdurra Oloroso",
      producer = P.glenlivet,
      style = W.Style.SingleMalt,
      abv = 60.0,
      casks = [ "oloroso sherry" ],
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Medium,
        price = { amount = 70, currency = W.Currency.Eur },
        market = W.Market.NlEu,
        claudePick = True,
        why = "The Glenlivet worth owning — cask-strength, sherried, NCF, great value. Skip the 12; this fits."
      }
    }
