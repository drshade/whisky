let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "compass-box-brulee-royale",
      name = "Brûlée Royale",
      producer = P.compassBox,
      style = W.Style.BlendedMalt,
      abv = 49.0,
      casks = [ "ex-bourbon", "American oak" ],
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Medium,
        price = { amount = 150, currency = W.Currency.Eur },
        market = W.Market.NlEu,
        tryFirst = True,
        why = "Tjaard's rec. Dessert-forward blended malt (Clynelish, Benrinnes, Ardbeg) — crème brûlée-inspired, 49% NCF. Limited edition (~8,500 bottles). ~€150 puts it above budget; sample before committing."
      }
    }
