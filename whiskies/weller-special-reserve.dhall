let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "weller-special-reserve",
      name = "W.L. Weller Special Reserve",
      producer = P.buffaloTrace,
      style = W.Style.Bourbon,
      abv = 45.0,
      externalNotes =
        [ W.ExternalNotes::{
            source = "Whisky Advocate (Minnick) + Breaking Bourbon (85/100)",
            summary = Some "Entry wheated Buffalo Trace bourbon (Weller/Pappy mashbill), 45% — sweet, approachable, gentle; over-delivers at MSRP but value eroded by market scarcity",
            nose = Some "Vanilla wafer, honey, subtle strawberry, caramel; floral citrus, apple, vanilla, toasted oak, hay, cinnamon; crème brûlée, praline (WA)",
            palate = Some "Honey, caramel, vanilla, light fruit; minimal spice (wheat effect); darker honey, oak, cinnamon, citrus, apple; sweet cherries, orange zest",
            finish = Some "Short to medium; slight heat; honey and caramel return; tannic with cinnamon and apple; dominant cinnamon spice; caramel-dipped apples"
          }
        ],
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Medium,
        price = { amount = 45, currency = W.Currency.Eur },
        market = W.Market.NlEu,
        tryFirst = True,
        why = "Darren's rec. The entry wheated bourbon — wheat replaces rye, so softer and rounder than BT or Blanton's. Classic Pappy mashbill without the scarcity tax. Worth sampling before committing given general bourbon scepticism."
      }
    }
