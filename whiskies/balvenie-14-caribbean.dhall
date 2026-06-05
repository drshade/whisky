let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "balvenie-14-caribbean",
      name = "Balvenie 14 Caribbean Cask",
      producer = P.balvenie,
      style = W.Style.SingleMalt,
      abv = 43.0,
      age = Some 14,
      casks = [ "rum finish" ],
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (Balvenie) + International Spirits Challenge Gold 2014",
            summary = Some "14yr traditional oak then finished in Caribbean rum casks — amplifies vanilla and tropical sweetness over honeyed Speyside base without overwhelming it",
            nose = Some "Rich creamy toffee, candied lemon, ripe banana, salted caramel, fresh pineapple, stewed orchard fruit, vanilla, coconut, light oak",
            palate = Some "Sweet vanilla, brown sugar, English toffee, mango, caramel, ginger, mild spice; creamy mouthfeel with rum-cask character clear but not shouty",
            finish = Some "Long and warm; brown sugar, cinnamon spice, raisins, vanilla; dry spice note at the close"
          }
        ],
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Splurge,
        theme = W.Theme.BrightSpeyside,
        findability = W.Findability.Green,
        note = "Honeyed malt with a rum-cask twist."
      }
    }
