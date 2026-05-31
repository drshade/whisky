let W = ../schema/Whisky.dhall

let P = ../producers.dhall

in  W.Whisky::{
      id = "woodford-double-oaked",
      name = "Woodford Double Oaked",
      producer = P.woodfordReserve,
      style = W.Style.Bourbon,
      abv = 45.2,
      ownership = Some W.Ownership::{ status = W.Status.Open },
      tasting = Some W.Tasting::{
        rating = 84,
        confidence = W.Confidence.Normal,
        summary = "good-value daily",
        journal = Some "journal/2026-05-29-woodford-double-oaked.md"
      }
    }
