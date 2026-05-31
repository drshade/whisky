let W = ../schema/Whisky.dhall

let P = ../schema/producers.dhall

in  W.Whisky::{
      id = "compass-box-orangerie",
      name = "Orangerie",
      producer = P.compassBox,
      style = W.Style.BlendedMalt,
      abv = 46.0,
      tasting = Some W.Tasting::{
        rating = 75,
        confidence = W.Confidence.Normal,
        summary = "orange-infused novelty; pleasant once the whisky emerged, but too zesty/sour",
        journal = Some "journal/2026-05-30-compass-box-orangerie.md"
      }
    }
