let W = ../schema/Whisky.dhall

let P = ../producers.dhall

in  W.Whisky::{
      id = "compass-box-hedonism",
      name = "Hedonism",
      producer = P.compassBox,
      style = W.Style.BlendedGrain,
      abv = 43.0,
      ownership = Some W.Ownership::{ status = W.Status.Open },
      tasting = Some W.Tasting::{
        rating = 91,
        confidence = W.Confidence.Normal,
        summary = "complex, sweet, sessionable",
        journal = Some "journal/2026-05-29-compass-box-hedonism.md"
      }
    }
