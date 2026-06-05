let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "glen-grant-15",
      name = "Glen Grant 15 Batch Strength",
      producer = P.glenGrant,
      style = W.Style.SingleMalt,
      abv = 50.0,
      age = Some 15,
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (Glen Grant) + Scotchology",
            summary = Some "First-fill ex-bourbon casks — fruit-forward, floral Speyside punching above its price; showcases Glen Grant's light copper-distillate character",
            nose = Some "Fresh citrus, florals, honeydew melon, caramel, spiced pear, apricot marmalade, vanilla, apple blossom, Meyer lemon",
            palate = Some "Rich and creamy; honey, vanilla, spiced pear, apricot, white pepper, honeysuckle, barley; lemon zest and green oak mid-palate",
            finish = Some "Elegant and lingering; nuttiness, delicate fruit, barrel sugars, white chocolate, oak spice; clean and satisfying"
          }
        ],
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Benchmark,
        theme = W.Theme.BrightSpeyside,
        findability = W.Findability.Amber,
        note = "All ex-bourbon, gorgeous fruit, huge value."
      }
    }
