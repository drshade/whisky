let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "ardbeg-10",
      name = "Ardbeg 10",
      producer = P.ardbeg,
      style = W.Style.SingleMalt,
      abv = 46.0,
      age = Some 10,
      casks = [ "peat" ],
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (Ardbeg)",
            summary = Some "Flagship 10yr ex-bourbon, 46% NCF, ~55ppm phenol — heavily peated but integrated; exceptional fruit-and-smoke balance",
            nose = Some "Exploding peat with tangy lemon and lime, black pepper, cinnamon-spiced toffee; wave of brine, smooth buttermilk, ripe bananas and currants",
            palate = Some "Smoke wells up with warm cappuccino and toasted marshmallows; dry espresso, liquorice root and tarry smoke coating the palate with chewy peat oils",
            finish = Some "Long and smoky; tarry espresso, aniseed, toasted almonds, soft barley and fresh pear — goes on and on"
          }
        ],
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Benchmark,
        theme = W.Theme.ClassicIslay,
        findability = W.Findability.Green,
        note = "Bright, medicinal, intense peat."
      }
    }
