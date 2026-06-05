let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "hakushu-12",
      name = "Hakushu 12",
      producer = P.suntory,
      style = W.Style.SingleMalt,
      abv = 43.0,
      age = Some 12,
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Splurge,
        theme = W.Theme.JapaneseWhisky,
        findability = W.Findability.Red,
        note = "Benchmark single malt — beautiful, but pricey & allocated."
      },
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (House of Suntory)",
            summary = Some "Lightly peated Japanese single malt from Suntory's mountain forest distillery — crisp, gently smoky, herbal and green",
            nose = Some "Basil, pine needle, green apple",
            palate = Some "Sweet pear, mint, kiwi",
            finish = Some "Green tea, subtle smoke"
          }
        ]
    }
