let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "blantons-gold",
      name = "Blanton's Gold",
      producer = P.buffaloTrace,
      style = W.Style.Bourbon,
      abv = 51.5,
      ownership = Some W.Ownership::{ status = W.Status.Open },
      tasting = Some W.Tasting::{
        rating = 84,
        confidence = W.Confidence.Normal,
        summary = "strong but harsh",
        journal = Some "journal/2026-05-29-blantons-gold-edition.md"
      },
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (Blanton's/Buffalo Trace)",
            summary = Some "Higher proof version of Original — spicy rye and tobacco lead, more intense but drier character; designed for international markets",
            nose = Some "Spicy rye and tobacco, caramel, honey, dark fruit, citrus, raisins; elevated proof adds warmth",
            palate = Some "Rye, tobacco, honey, charred oak, vanilla; drier than expected with pepper and spice more evident than Original",
            finish = Some "Very long and harmonious; slow-building spice, rye, charred wood, leather, honey; dry and lingering"
          }
        ]
    }
