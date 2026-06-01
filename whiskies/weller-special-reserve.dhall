let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "weller-special-reserve",
      name = "W.L. Weller Special Reserve",
      producer = P.buffaloTrace,
      style = W.Style.Bourbon,
      abv = 45.0,
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Medium,
        price = { amount = 45, currency = W.Currency.Eur },
        market = W.Market.NlEu,
        tryFirst = True,
        why = "Darren's rec. The entry wheated bourbon — wheat replaces rye, so softer and rounder than BT or Blanton's. Classic Pappy mashbill without the scarcity tax. Worth sampling before committing given general bourbon scepticism."
      }
    }
