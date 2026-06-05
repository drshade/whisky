let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "widow-jane-baby-jane",
      name = "Baby Jane",
      producer = P.widowJane,
      style = W.Style.Bourbon,
      abv = 45.5,
      ownership = Some W.Ownership::{ status = W.Status.Open },
      tasting = Some W.Tasting::{
        rating = 80,
        confidence = W.Confidence.Low,
        summary = "premium, underwhelming",
        journal = Some "journal/2026-05-29-widow-jane-baby-jane.md"
      },
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (Widow Jane)",
            summary = Some "Heirloom corn; depth, sweetness and creamy spiciness in a distinctive Brooklyn style",
            nose = Some "Salty air, green grape, honeycomb, cream soda",
            palate = Some "Strawberries and cream taffy, salted caramel, fresh fig, allspice, café au lait",
            finish = Some "Peach compote, star anise, cut hay, horchata, milk chocolate"
          }
        ]
    }
