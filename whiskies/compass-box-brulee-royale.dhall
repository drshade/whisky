let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "compass-box-brulee-royale",
      name = "Brûlée Royale",
      producer = P.compassBox,
      style = W.Style.BlendedMalt,
      abv = 49.0,
      casks = [ "ex-bourbon", "American oak" ],
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (Compass Box) + Fred Minnick + Robb Report",
            summary = Some "Blended malt (Clynelish, Benrinnes 18yr, Speyburn, 0.5% Ardbeg) inspired by François Massialot's 17th-century crème brûlée recipe; ~8,556 bottles, NCF",
            nose = Some "Crème brûlée, poached pear, fresh vanilla, brown sugar, cinnamon, molasses, nutmeg, clove, orange zest",
            palate = Some "Clotted cream, honeyed malt, broiled peaches, tarte tatin, vanilla, stone fruits (plum, peach), cinnamon, nutmeg, honey, fennel; extravagant sweetness balanced by spice",
            finish = Some "Long and silken; nutmeg, burnt toffee, banana split, honey, cinnamon, mint, white pepper"
          }
        ],
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Medium,
        price = { amount = 150, currency = W.Currency.Eur },
        market = W.Market.NlEu,
        tryFirst = True,
        why = "Tjaard's rec. Dessert-forward blended malt (Clynelish, Benrinnes, Ardbeg) — crème brûlée-inspired, 49% NCF. Limited edition (~8,500 bottles). ~€150 puts it above budget; sample before committing."
      }
    }
