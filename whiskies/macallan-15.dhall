let W = ../schema/Whisky.dhall

let P = ../schema/producers.dhall

in  W.Whisky::{
      id = "macallan-15",
      name = "Macallan 15",
      producer = P.macallan,
      style = W.Style.SingleMalt,
      abv = 43.0,
      age = Some 15,
      casks = [ "sherry" ],
      tasting = Some W.Tasting::{
        rating = 83,
        confidence = W.Confidence.Low,
        summary = "sherried, rich — landed well, but hazy/pre-serious memory; brand-premium (revisit)",
        journal = Some "journal/2026-02-15-macallan-15.md"
      }
    }
