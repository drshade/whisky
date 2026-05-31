let W = ../schema/Whisky.dhall

in  W.Whisky::{
      id = "compass-box-spice-tree",
      name = "Spice Tree",
      classification = W.scotchBlendedMalt W.ScotchBlender.CompassBox,
      abv = 46.0,
      tasting = Some W.Tasting::{
        rating = 81,
        confidence = W.Confidence.Low,
        summary = "light, fruity, nice but simple; less spicy than the name suggests",
        journal = Some "journal/2026-05-29-compass-box-spice-tree.md"
      }
    }
