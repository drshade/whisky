let W = ../schema/Whisky.dhall

let P = ../schema/producers.dhall

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
      }
    }
