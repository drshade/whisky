let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "oban-14",
      name = "Oban 14",
      producer = P.oban,
      style = W.Style.SingleMalt,
      abv = 43.0,
      age = Some 14,
      ownership = Some W.Ownership::{ status = W.Status.Open },
      tasting = Some W.Tasting::{
        rating = 80,
        confidence = W.Confidence.Normal,
        summary = "characterful, coastal",
        journal = Some "journal/2026-05-29-oban-14.md"
      }
    }
