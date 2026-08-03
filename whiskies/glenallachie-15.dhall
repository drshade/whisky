let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "glenallachie-15",
      name = "GlenAllachie 15",
      producer = P.glenAllachie,
      style = W.Style.SingleMalt,
      abv = 46.0,
      age = Some 15,
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (GlenAllachie) + WA (92 pts) + WWA 2024 Best Scotch Speyside 13-20yr",
            summary = Some "Quad cask: PX sherry, oloroso sherry, red wine, virgin oak; 46% NCF; WA 92 — 'rich and intense, pulsing with bold sherry cask character'; San Francisco Double Gold 2024",
            nose = Some "Dark cherries, golden syrup, sweet spices, toffee, glazed figs, hazelnuts; baked orange, cherry, currants, cinnamon, cocoa powder",
            palate = Some "Heather honey, orange peel, cocoa, ginger; dark chocolate, Seville orange marmalade, Nutella, black pepper, cola, sultana, ground coffee",
            finish = Some "Caramelised brown sugar, dark chocolate, molasses, rum-soaked fruitcake; long and intense"
          }
        ],
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Medium,
        price = { amount = 80, currency = W.Currency.Eur },
        market = W.Market.NlEu,
        tryFirst = True,
        why = "User pick. Either/or with GlenAllachie 12 — same distillery, more intensity and cask complexity. WA 92."
      }
    }
