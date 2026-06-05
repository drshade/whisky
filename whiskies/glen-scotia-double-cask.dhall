let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "glen-scotia-double-cask",
      name = "Glen Scotia Double Cask",
      producer = P.glenScotia,
      style = W.Style.SingleMalt,
      abv = 46.0,
      externalNotes =
        [ W.ExternalNotes::{
            source = "Greatdrams + Scotch Noob",
            summary = Some "Ex-bourbon then PX sherry finish — Campbeltown's oiliness and coastal edge softened by PX; complex flavours with broad appeal, comparable to Balvenie DoubleWood",
            nose = Some "Maritime dried fruit (raisins, apricots), sherry, toffee, vanilla, baking spice, tropical notes (kiwi, white peach), coastal mineral salt",
            palate = Some "PX waves of raisins, dates, buttery toffee; mid-palate spice — black pepper, ginger, cinnamon; oily, slightly salty, caramel and honey throughout",
            finish = Some "Long with layers of spice; quite dry; returning toffee and oak; some tannic drying toward the end"
          }
        ],
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Entry,
        theme = W.Theme.CampbeltownMalts,
        findability = W.Findability.Amber,
        note = "Easiest Campbeltown to find; salty, vanilla, gentle."
      }
    }
