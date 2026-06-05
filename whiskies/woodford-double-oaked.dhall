let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

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
      },
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official",
            summary = Some "Twice-barreled: charred oak then deeply toasted second barrel for extra richness",
            nose = Some "Dark fruit, caramel, sharp honey, chocolate, marzipan, toasted oak",
            palate = Some "Full-bodied vanilla, dark caramel, hazelnut, apple, fruit and spices",
            finish = Some "Long and creamy with lingering honeyed apple"
          }
        ]
    }
