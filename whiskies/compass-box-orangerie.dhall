let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "compass-box-orangerie",
      name = "Orangerie",
      producer = P.compassBox,
      style = W.Style.BlendedMalt,
      abv = 46.0,
      tasting = Some W.Tasting::{
        rating = 75,
        confidence = W.Confidence.Normal,
        summary = "orange-infused novelty; pleasant once the whisky emerged, but too zesty/sour",
        journal = Some "journal/2026-05-30-compass-box-orangerie.md"
      },
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (Compass Box)",
            summary = Some "Highland malt + Fife grain infused with Navalino orange peel, Indonesian cassia bark and cloves; classified as spirit drink, now discontinued",
            nose = Some "Fresh orange oils, Christmas cake, ginger cake spice",
            palate = Some "Mellow whisky with vanilla and cassia bark; zesty orange leads with clove heat behind",
            finish = Some "Orange and spice; notably short"
          }
        ]
    }
