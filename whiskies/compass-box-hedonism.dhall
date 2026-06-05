let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "compass-box-hedonism",
      name = "Hedonism",
      producer = P.compassBox,
      style = W.Style.BlendedGrain,
      abv = 43.0,
      ownership = Some W.Ownership::{ status = W.Status.Open },
      tasting = Some W.Tasting::{
        rating = 91,
        confidence = W.Confidence.Normal,
        summary = "complex, sweet, sessionable",
        journal = Some "journal/2026-05-29-compass-box-hedonism.md"
      },
      externalNotes =
        [ W.ExternalNotes::{
            source = "Whisky Advocate (90 pts, 2024)",
            summary = Some "Showcases the purity and richness possible in mature Scottish grain whisky — sweet, silky, vanilla-forward with a spiced finish",
            nose = Some "Sweet and softly floral — honey, candied lemon, vanilla cream, bubblegum, green apple, fresh-cut melon, baked oatmeal cookies",
            palate = Some "Syrupy; honey, vanilla, banana, walnut bread, buttercream, milk chocolate, coconut, apricot, peach, macadamia",
            finish = Some "Cinnamon and cayenne pepper, flash of mint, subtle lingering warmth; relatively short but satisfying"
          }
        ]
    }
