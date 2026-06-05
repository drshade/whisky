let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "larceny-barrel-proof",
      name = "Larceny Barrel Proof",
      producer = P.heavenHill,
      style = W.Style.Wheated,
      abv = 62.0,
      externalNotes =
        [ W.ExternalNotes::{
            source = "Whisky Advocate (95 pts, Whisky of the Year 2020)",
            summary = Some "Wheated barrel-proof bourbon, 3 batches/year — WA Whisky of the Year 2020; exceptional value: rich bakery sweetness, chocolate depth and long spicy finish",
            nose = Some "Honey bun, angel food cake, apple pie à la mode; toasted bread, maple, cinnamon, butterscotch, ripe banana, untoasted marshmallow",
            palate = Some "Crème brûlée, chocolate, drizzled caramel, honey-roasted peanuts, lashings of baking spice, molasses, fig, hazelnut, pecan praline",
            finish = Some "Lengthy, loaded with cinnamon, chocolate and robust spice; nuanced flavour fades into lingering warmth"
          }
        ],
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Medium,
        price = { amount = 90, currency = W.Currency.Eur },
        market = W.Market.NlEu,
        claudePick = True,
        why = "Wheated barrel-proof — sweeter + strong + layered (all my levers). Allocated/pricey but gettable via EU specialists."
      }
    }
