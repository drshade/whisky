let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "glenfarclas-105",
      name = "Glenfarclas 105",
      producer = P.glenfarclas,
      style = W.Style.SingleMalt,
      abv = 60.0,
      casks = [ "sherry" ],
      externalNotes =
        [ W.ExternalNotes::{
            source = "Whisky Jug + The Whiskyphiles",
            summary = Some "Original cask-strength single malt since 1968 (~8-10yr, 60%); ex-sherry and ex-bourbon — legendary bang-for-buck sherry bomb, named best value by Malt Maniacs",
            nose = Some "Rich sherry dominates: sultanas, cherries, figs, cinnamon, walnut; creamy honey, chocolate, hazelnut, dried dark fruit, citrus peel, butterscotch",
            palate = Some "Dark chocolate, orange peel, sultanas, figs; ginger, clove, mace, nutmeg; fruity and spirity; creamy, honied, slightly leathery",
            finish = Some "Long and peppery; oak spice and boozy burn; Cadbury Fruit and Nut flavours; honeyed sweetness, nuts and earthy chocolate"
          }
        ],
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Medium,
        price = { amount = 74, currency = W.Currency.Eur },
        market = W.Market.NlEu,
        claudePick = True,
        why = "Cask-strength sherry bomb; a cheaper A'bunadh alternative worth comparing."
      }
    }
