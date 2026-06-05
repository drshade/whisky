let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "aberlour-abunadh",
      name = "Aberlour A'bunadh",
      producer = P.aberlour,
      style = W.Style.SingleMalt,
      abv = 60.0,
      casks = [ "oloroso sherry" ],
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (Aberlour) + The Whiskey Wash (94/100)",
            summary = Some "Cask-strength NAS ex-oloroso sherry butts only — unapologetic sherry bomb with enormous body, dried-fruit richness; batches ~59-61%",
            nose = Some "Allspice, praline, spiced orange, deep oloroso sherry; cooked stone fruit, candied orange peel, marmalade, nutmeg, cinnamon, honey, walnut",
            palate = Some "Orange, black cherries, dried apricot, fig, raisin, ginger, dark bitter chocolate; superlatively full-bodied, creamy and oily",
            finish = Some "Robust and long-lasting; bittersweet exotic spices, dark chocolate, oak, caramel, pepper"
          }
        ],
      wishlist = Some W.Wishlist::{
        priority = W.Priority.High,
        price = { amount = 60, currency = W.Currency.Eur },
        market = W.Market.NlEu,
        why = "Best off-shelf profile match: cask-strength oloroso sherry bomb = sweetness + complexity + earned strength. Fills the sherried-Speyside gap."
      }
    }
