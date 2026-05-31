let W = ../schema/Whisky.dhall

in  W.Whisky::{
      id = "compass-box-orangerie",
      name = "Orangerie",
      classification = W.scotchBlendedMalt W.ScotchBlender.CompassBox,
      abv = 46.0,
      tasting = Some W.Tasting::{
        rating = 75,
        confidence = W.Confidence.Normal,
        summary = "orange-infused novelty; pleasant once the whisky emerged, but too zesty/sour",
        journal = Some "journal/2026-05-30-compass-box-orangerie.md"
      }
    }
