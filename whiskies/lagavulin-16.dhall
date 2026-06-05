let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "lagavulin-16",
      name = "Lagavulin 16",
      producer = P.lagavulin,
      style = W.Style.SingleMalt,
      abv = 43.0,
      age = Some 16,
      casks = [ "peat" ],
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (malts.com) + dram1.com",
            summary = Some "The benchmark Islay expression: heavy peat, sherry cask richness and unexpected fruit balance — approachable for the style yet deeply layered",
            nose = Some "Intensely peated smoke with iodine, seaweed and rich sweetness; Lapsang Souchong tea, pipe tobacco, kippers, dark chocolate raisins, dried figs, molasses",
            palate = Some "Dry peat smoke with gentle sweetness, sea, salt, wood; cured meats, dried tobacco, maple syrup, caramel, ash; strawberry lemonade cutting through the peat",
            finish = Some "Long, elegant, peat-filled with salt and seaweed; ash and tannic oak then pear, cherry, lingering strawberry; structured and mature"
          }
        ],
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Benchmark,
        theme = W.Theme.ClassicIslay,
        findability = W.Findability.Green,
        note = "The benchmark — deep, smoky, sweet, iconic."
      }
    }
