let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

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
      },
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (Glenmorangie)",
            summary = Some "Travel-retail NAS; PX sherry + charred virgin oak finish on ex-bourbon base",
            nose = Some "Pear, toffee apple, Brazil nuts in toffee, spice, toasty oak; water reveals vanilla fudge and linseed",
            palate = Some "Milk chocolate, toffee, Brazil nuts, leather, aniseed; gentle ginger and clove spice",
            finish = Some "Vanilla, apricots in cream, almond marzipan"
          }
        ]
    }
