let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "kavalan-solist",
      name = "Kavalan Solist",
      producer = P.kavalan,
      style = W.Style.SingleMalt,
      abv = 57.0,
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Splurge,
        theme = W.Theme.OtherWorld,
        findability = W.Findability.Red,
        note = "Single-cask, lush tropical fruit; the splurge."
      },
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (Kavalan) + Whiskey Apostle (2024)",
            summary = Some "Single cask, cask strength Taiwanese malt in used American oak wine barrels — intense tropical-meets-dark-fruit, Double Gold 2023 World Whisky",
            nose = Some "Raisins, berries, leather, toffee, charred oak, baking spices, balsamic-drizzled mango, red and dark fruits",
            palate = Some "Rich, thick mouthfeel; cherries, strawberries, raspberries, fudge toffee, plums, dates, honey, vanilla, pepper",
            finish = Some "Long and syrupy — dark fruit, honey, allspice, chocolate on the tail"
          }
        ]
    }
