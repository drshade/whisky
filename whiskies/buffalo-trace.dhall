let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "buffalo-trace",
      name = "Buffalo Trace",
      producer = P.buffaloTrace,
      style = W.Style.Bourbon,
      abv = 45.0,
      ownership = Some W.Ownership::{ status = W.Status.Open },
      tasting = Some W.Tasting::{
        rating = 82,
        confidence = W.Confidence.Normal,
        summary = "mixer / boulevardiers",
        journal = Some "journal/2026-05-29-buffalo-trace.md"
      }
    }
