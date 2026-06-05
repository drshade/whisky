let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "redbreast-12",
      name = "Redbreast 12",
      producer = P.midleton,
      style = W.Style.SinglePotStill,
      abv = 40.0,
      age = Some 12,
      casks = [ "ex-bourbon", "oloroso sherry" ],
      tasting = Some W.Tasting::{
        rating = 85,
        confidence = W.Confidence.Low,
        summary = "sherried, well-rounded; balanced not deep — confirmed buy",
        journal = Some "journal/2026-05-30-redbreast-12.md"
      },
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (Redbreast)",
            summary = Some "Benchmark single pot still — malted and unmalted barley, triple-distilled, ex-bourbon and oloroso sherry; full-flavoured, silky, exceptionally complex for 40%",
            nose = Some "Complex, spicy and fruity; toasted wood, tropical fruit, orange peel, baked pie crust, vanilla, sherry-dried fruit and winter spice",
            palate = Some "Full-flavoured and silky smooth; vanilla, almond, honey, apricot, raisin, cinnamon, cocoa; harmonious balance of spicy, fruity and sherry notes",
            finish = Some "Satisfyingly long; cinnamon, caraway, marzipan, toasted almond, lingering sherry nuttiness"
          }
        ],
      wishlist = Some W.Wishlist::{
        priority = W.Priority.High,
        price = { amount = 42, currency = W.Currency.Eur },
        market = W.Market.NlEu,
        claudePick = True,
        why = "Opens Irish pot still — lush, sherried, complex. Sampled at dinner, confirmed buy."
      },
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Benchmark,
        theme = W.Theme.IrishPotStill,
        findability = W.Findability.Green,
        note = "The pot-still benchmark — sherried, lush, a must-try."
      }
    }
