let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "compass-box-peat-monster-cs",
      name = "Compass Box The Peat Monster Cask Strength",
      producer = P.compassBox,
      style = W.Style.BlendedMalt,
      abv = 53.9,
      casks = [ "peat" ],
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Medium,
        price = { amount = 90, currency = W.Currency.Eur },
        market = W.Market.NlEu,
        claudePick = True,
        why = "Compass Box house style (Hedonism #1) meets Islay peat — ~64% Caol Ila + ~35% Laphroaig at 53.9% CS. The standard 46% is too gentle; the CS earns its strength like the Sanaig did. ABV and price approximate — verify before buying."
      }
    }
