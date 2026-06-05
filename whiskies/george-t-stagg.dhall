let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "george-t-stagg",
      name = "George T. Stagg",
      producer = P.buffaloTrace,
      style = W.Style.Bourbon,
      abv = 65.0,
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (Buffalo Trace) + VinePair (96/100)",
            summary = Some "Uncut, unfiltered BTAC bourbon (2024: 15yr, 136.1 proof) — dark cherry, syrupy vanilla and oak; 'a worthy continuation of one of the most revered expressions in American whiskey'",
            nose = Some "Cinnamon, allspice, cherry cola, black raspberry, pear; black cherry and vanilla with barrel char",
            palate = Some "Syrup-soaked cherries, rolling oak tannins, caramel, allspice, leather, stone fruit, tobacco; wonderfully viscous",
            finish = Some "Intense spice, barrel char, dry cherry, baking chocolate; cinnamon and black pepper linger for minutes"
          }
        ],
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Low,
        price = { amount = 600, currency = W.Currency.Eur },
        market = W.Market.NlEu,
        claudePick = True,
        tryFirst = True,
        why = "The unicorn. Taste it if a bottle's open — you'll never buy one."
      }
    }
