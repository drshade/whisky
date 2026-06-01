let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "compass-box-peat-monster",
      name = "The Peat Monster",
      producer = P.compassBox,
      style = W.Style.BlendedMalt,
      abv = 46.0,
      tasting = Some W.Tasting::{
        rating = 87,
        confidence = W.Confidence.Normal,
        summary = "smooth, balanced peated blend; smoke up front masking layers beneath; classic Islay funk (pleasant rotty-foot); all-day sessionable",
        journal = Some "journal/2026-06-01-compass-box-peat-monster.md"
      }
    }
