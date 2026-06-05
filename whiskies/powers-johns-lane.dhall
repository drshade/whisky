let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "powers-johns-lane",
      name = "Powers John's Lane 12",
      producer = P.midleton,
      style = W.Style.SinglePotStill,
      abv = 46.0,
      age = Some 12,
      externalNotes =
        [ W.ExternalNotes::{
            source = "Whisky Advocate (94 pts) + Dramface",
            summary = Some "Ex-bourbon with a small proportion of oloroso sherry — pot still spice showcase; signature oily, green-peppery character from unmalted barley; 94 pts WA",
            nose = Some "Brooding, primal, oily; Bramley apples, oolong tea, green banana, hint of sherry; allspice, peppercorns, star anise; candied orange peel, fragrant florals, honey",
            palate = Some "Fruit and chocolate ahead of spices; orange, chocolate, coffee, apricot, marmalade on buttered toast; honey, dark chocolate, coffee, raisin; warming ginger and black pepper",
            finish = Some "Heavier spices, bitter chocolate, dusty cocoa; long with cask char, caramelised fruit, mocha; moderate length with chocolate and cream"
          }
        ],
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Splurge,
        theme = W.Theme.IrishPotStill,
        findability = W.Findability.Amber,
        note = "Deeper, oilier, full-strength pot still."
      }
    }
