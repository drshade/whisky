let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "stagg",
      name = "Stagg",
      producer = P.buffaloTrace,
      style = W.Style.Bourbon,
      abv = 65.0,
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (Buffalo Trace)",
            summary = Some "Uncut, unfiltered barrel-proof bourbon (formerly Stagg Jr) — bold and unapologetic; rich chocolate and brown sugar balanced with rye spice",
            nose = Some "Rich chocolate, brown sugar, dark sweetness with hints of oak",
            palate = Some "Rich sweet chocolate and brown sugar in balance with bold rye spice",
            finish = Some "Boundless and long-lingering; hints of cherries, cloves and smokiness"
          }
        ],
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Low,
        price = { amount = 80, currency = W.Currency.Eur },
        market = W.Market.NlEu,
        claudePick = True,
        why = "Barrel-proof intensity & complexity (ex-'Stagg Jr', NOT George T. Stagg). Allocated/pricey even in EU — a grab-on-sight, not a planned buy."
      }
    }
