let W = ../schema/Whisky.dhall

let P = ../schema/producers.dhall

in  W.Whisky::{
      id = "glenmorangie-duthac",
      name = "Glenmorangie Duthac",
      producer = P.glenmorangie,
      style = W.Style.SingleMalt,
      abv = 43.0,
      ownership = Some W.Ownership::{ status = W.Status.Open },
      tasting = Some W.Tasting::{
        rating = 68,
        confidence = W.Confidence.Normal,
        summary = "bland, bitter edge",
        journal = Some "journal/2026-05-29-glenmorangie-duthac.md"
      }
    }
