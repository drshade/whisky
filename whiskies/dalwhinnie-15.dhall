let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "dalwhinnie-15",
      name = "Dalwhinnie 15",
      producer = P.dalwhinnie,
      style = W.Style.SingleMalt,
      abv = 43.0,
      age = Some 15,
      ownership = Some W.Ownership::{ status = W.Status.Open },
      tasting = Some W.Tasting::{
        rating = 72,
        confidence = W.Confidence.Normal,
        summary = "gentle, dull",
        journal = Some "journal/2026-05-29-dalwhinnie-15.md"
      }
    }
