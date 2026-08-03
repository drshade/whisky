let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "glenallachie-12",
      name = "GlenAllachie 12",
      producer = P.glenAllachie,
      style = W.Style.SingleMalt,
      abv = 46.0,
      age = Some 12,
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (GlenAllachie) + WWA 2025 World's Best Single Malt + WA (85 pts)",
            summary = Some "Triple cask: first-fill PX sherry, first-fill oloroso sherry, virgin American oak; 46% NCF; Billy Walker's signature; World's Best Single Malt WWA 2025 and Best Scotch Speyside 2024",
            nose = Some "Dark chocolate, treacle, heather honey, cinnamon, espresso, sticky raisins",
            palate = Some "Marzipan, orchard fruit, mocha, butterscotch, grated nutmeg",
            finish = Some "Medium length; ginger and clove spice warmth, drying oak, cocoa powder, lingering dried fruit"
          }
        ],
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Medium,
        price = { amount = 50, currency = W.Currency.Eur },
        market = W.Market.NlEu,
        why = "User pick. Triple sherry cask (PX + oloroso + virgin oak), Billy Walker's Speyside — World's Best Single Malt WWA 2025."
      }
    }
