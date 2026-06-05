let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "makers-mark",
      name = "Maker's Mark",
      producer = P.makersMark,
      style = W.Style.Wheated,
      abv = 45.0,
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (Maker's Mark) + Breaking Bourbon",
            summary = Some "Accessible wheated bourbon; sweet, clean and fruit-forward, never harsh; softness from red winter wheat is the defining character — excellent cocktail bourbon",
            nose = Some "Sweet oak, vanilla, bright fruit and wheat; sweet apples and pears, sweet cherries, light orange citrus, caramel, light brown sugar",
            palate = Some "Sweet with balance of oak, vanilla and fruit; pears, caramel, brown sugar, cornbread, cherry, grassy; clove and cinnamon supporting",
            finish = Some "Smooth and creamy with soft spice; increasingly dry with black pepper and barrel char; fairly short to medium"
          }
        ],
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Entry,
        theme = W.Theme.WheatedBourbon,
        findability = W.Findability.Green,
        note = "The accessible wheated benchmark."
      }
    }
