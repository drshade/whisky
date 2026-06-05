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
      },
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (malts.com)",
            summary = Some "Full, rich, almost oily malt with maritime character — sits between Highland and Islay in style",
            nose = Some "Immediate and confident; warming, sweet, oily, waxy, nutty with ripe orchard fruits",
            palate = Some "Dense and coating; sweet yet menthol-fresh, filling with rich fruit-bread chewiness",
            finish = Some "Long; syrupy then drying with elegant dark chocolate tannins"
          }
        ]
    }
