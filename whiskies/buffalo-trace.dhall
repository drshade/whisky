let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "buffalo-trace",
      name = "Buffalo Trace",
      producer = P.buffaloTrace,
      style = W.Style.Bourbon,
      abv = 45.0,
      ownership = Some W.Ownership::{ status = W.Status.Open },
      tasting = Some W.Tasting::{
        rating = 82,
        confidence = W.Confidence.Normal,
        summary = "mixer / boulevardiers",
        journal = Some "journal/2026-05-29-buffalo-trace.md"
      },
      externalNotes =
        [ W.ExternalNotes::{
            source = "Jim Murray's Whisky Bible (via Buffalo Trace)",
            summary = Some "Big, moody, uncompromising and complex beyond belief",
            nose = Some "Spicy prickle, deep vanilla, molasses, hint of sweet mint",
            palate = Some "Waxy sweetness, vanilla oak, chewy corn, rye spice, leather, tobacco, overripe orange",
            finish = Some "Long and lush; oak dries it, rye adds depth, lingering liquorice"
          }
        ]
    }
