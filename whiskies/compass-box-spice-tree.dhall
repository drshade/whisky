let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "compass-box-spice-tree",
      name = "Spice Tree",
      producer = P.compassBox,
      style = W.Style.BlendedMalt,
      abv = 46.0,
      tasting = Some W.Tasting::{
        rating = 81,
        confidence = W.Confidence.Low,
        summary = "light, fruity, nice but simple; less spicy than the name suggests",
        journal = Some "journal/2026-05-29-compass-box-spice-tree.md"
      },
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (Compass Box)",
            summary = Some "Clynelish-dominant recipe with French oak heads for spice and American oak bodies; rich, approachable, spice-driven",
            nose = Some "Clove, ginger, cinnamon, nutmeg and vanilla",
            palate = Some "Full, round and sweet; baking spice and vanilla complementing fruity, malty Clynelish character",
            finish = Some "Long and sustained with gentle warmth and continued clove (Whiskey Wash)"
          }
        ]
    }
