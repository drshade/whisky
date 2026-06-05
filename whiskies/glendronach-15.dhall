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
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (GlenDronach) + The Whiskey Wash (9/10) + Best in Show SFWSC 2020",
            summary = Some "PX and oloroso sherry casks — one of the most acclaimed sherried Highland malts; rich, layered, authentic sherry without being cloying",
            nose = Some "Maraschino cherry, ripe bramble, dark chocolate mint, orange bitters, walnut liqueur; cassis, dark woods, cinnamon, clove, dried fruit, treacle toffee",
            palate = Some "Honey-glazed apricot, ripe fig, black cherry, muscovado; persimmon gingerbread, marzipan, dark fruit, orange oil, figs, prunes, cocoa, ginger",
            finish = Some "Long and enveloping; dark manuka honey, herbal bitters, dark chocolate; baking spices and dark fruit"
          }
        ],
      wishlist = Some W.Wishlist::{
        priority = W.Priority.High,
        price = { amount = 90, currency = W.Currency.Eur },
        market = W.Market.NlEu,
        claudePick = True,
        why = "Deep dried-fruit sherry; sweetness + complexity bullseye."
      }
    }
