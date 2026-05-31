let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "aberlour-abunadh",
      name = "Aberlour A'bunadh",
      producer = P.aberlour,
      style = W.Style.SingleMalt,
      abv = 60.0,
      casks = [ "oloroso sherry" ],
      wishlist = Some W.Wishlist::{
        priority = W.Priority.High,
        price = { amount = 60, currency = W.Currency.Eur },
        market = W.Market.NlEu,
        why = "Best off-shelf profile match: cask-strength oloroso sherry bomb = sweetness + complexity + earned strength. Fills the sherried-Speyside gap."
      }
    }
