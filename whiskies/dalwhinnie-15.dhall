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
      },
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (malts.com)",
            summary = Some "Clean, crisp, accessible — heather and honey sweetness from Scotland's highest distillery",
            nose = Some "Big, crisp, dry and aromatic with hints of heather and peat",
            palate = Some "Smooth, light to medium body; heather-honey, vanilla, citrus fruit, malted bread",
            finish = Some "Long, surprisingly intense; starts sweet then gives way to smoke, peat and malt"
          }
        ]
    }
