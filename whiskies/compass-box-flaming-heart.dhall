let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "compass-box-flaming-heart",
      name = "Compass Box Flaming Heart",
      producer = P.compassBox,
      style = W.Style.BlendedMalt,
      abv = 48.9,
      casks = [ "peat" ],
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (Compass Box, 2025 edition)",
            summary = Some "Limited blended malt — Benrinnes, Laphroaig, Williamson, Talisker in custom French oak; only 9,384 bottles; recurring release since early 2000s",
            nose = Some "Rich oily smoke with zingy spice; raspberry and apricot; cookie dough and miso depth; tarry rope",
            palate = Some "Dense; clove, pink and black pepper, nutmeg; medicinal peat duelling with bright winey fruit; epic tension between smoke and sweetness",
            finish = Some "Concentrated smoke — simultaneously woody and ashy — with menthol and citrus oils; long and satisfyingly smoky"
          }
        ],
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Medium,
        price = { amount = 120, currency = W.Currency.Eur },
        market = W.Market.NlEu,
        claudePick = True,
        tryFirst = True,
        why = "I click with Compass Box (Hedonism #1) — this is their peat + complexity flagship. Taste before buying."
      }
    }
