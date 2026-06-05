let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "starward-nova",
      name = "Starward Nova",
      producer = P.starward,
      style = W.Style.SingleMalt,
      abv = 41.0,
      casks = [ "red wine" ],
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (Starward)",
            summary = Some "Fully matured (not finished) in Australian red wine barrels, 41% — pronounced fruit and chocolate character at an approachable ABV; multi-award winner",
            nose = Some "Bold red berries, dark chocolate, orchard fruit",
            palate = Some "Rich chocolate raspberry pudding with vanilla, caramel and spice",
            finish = Some "Bright red fruit gradually joined by a touch of oak; soft and long"
          }
        ],
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Entry,
        theme = W.Theme.OtherWorld,
        findability = W.Findability.Amber,
        note = "Red-wine-cask matured; juicy, approachable."
      }
    }
