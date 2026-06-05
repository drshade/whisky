let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "compass-box-peat-monster",
      name = "The Peat Monster",
      producer = P.compassBox,
      style = W.Style.BlendedMalt,
      abv = 46.0,
      tasting = Some W.Tasting::{
        rating = 87,
        confidence = W.Confidence.Normal,
        summary = "smooth, balanced peated blend; smoke up front masking layers beneath; classic Islay funk (pleasant rotty-foot); all-day sessionable",
        journal = Some "journal/2026-06-01-compass-box-peat-monster.md"
      },
      externalNotes =
        [ W.ExternalNotes::{
            source = "Whisky Advocate (95 pts, #9 of 2020)",
            summary = Some "Bigger peat more elegantly — aromatic sweet smoke balanced with complex layered peat; NAS blended malt, not chill-filtered",
            nose = Some "Candied citrus, lemon cake, raspberry, charcoal, iodine, salted butter, mushroom, umami, coastal earthiness; sweet smoke beneath",
            palate = Some "Brine, seashells, floral peat, vanilla, tropical lime, smoked meats, generous spice; sooty with subtle salinity",
            finish = Some "Bitter chocolate, lemon hard candy, smoke, bang of spice; sweetness layered with smoke, fruit, and meadow grass; medium-long"
          }
        ]
    }
