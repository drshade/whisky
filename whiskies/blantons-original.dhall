let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "blantons-original",
      name = "Blanton's Original",
      producer = P.buffaloTrace,
      style = W.Style.Bourbon,
      abv = 46.5,
      ownership = Some W.Ownership::{ status = W.Status.Open },
      tasting = Some W.Tasting::{
        rating = 84,
        confidence = W.Confidence.Normal,
        summary = "the bourbon that transcends",
        journal = Some "journal/2026-05-29-blantons-original.md"
      },
      externalNotes =
        [ W.ExternalNotes::{
            source = "Breaking Bourbon",
            summary = Some "The world's first single barrel bourbon (1984) — sweet, approachable, vanilla and caramel with baking spices; a reliable benchmark",
            nose = Some "Creamy vanilla, caramel, butterscotch, baking spices (clove, nutmeg, cinnamon), honey, light citrus peel, barrel char",
            palate = Some "Sweet caramel, honey, muted vanilla, brown sugar; deeper leather, charred oak, rye spice, white pepper",
            finish = Some "Crisp and medium-length — vanilla, caramel, leather, dry oak, rye spice, light peppercorn"
          }
        ]
    }
