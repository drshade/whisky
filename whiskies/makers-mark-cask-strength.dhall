let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "makers-mark-cask-strength",
      name = "Maker's Mark Cask Strength",
      producer = P.makersMark,
      style = W.Style.Wheated,
      abv = 55.0,
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (Maker's Mark) + Breaking Bourbon",
            summary = Some "Standard Maker's dialled up: same wheat-forward softness with amplified oak, salted caramel and dark chocolate; surprisingly smooth for barrel proof",
            nose = Some "Toasted oak, salted caramel, warm vanilla; toffee, brown sugar, dark cherries, orange peel, marshmallow, cream soda, dark molasses",
            palate = Some "Robust and warm; salted caramel, vanilla, spice; toffee, brown sugar, dry oak, dark cherries, cinnamon, sweet wheat grain; dark chocolate underneath",
            finish = Some "Full and enveloping; dark chocolate and espresso; lingering black pepper, tannins and dry oak; medium to long"
          }
        ],
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Splurge,
        theme = W.Theme.WheatedBourbon,
        findability = W.Findability.Red,
        note = "Wheated, full-power. (Weller is the allocated alternative.)"
      }
    }
