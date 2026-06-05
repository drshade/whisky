let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "jameson-black-barrel",
      name = "Jameson Black Barrel",
      producer = P.midleton,
      style = W.Style.Blend,
      abv = 40.0,
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Entry,
        theme = W.Theme.IrishPotStill,
        findability = W.Findability.Green,
        note = "Easy, rich entry into the Irish idea."
      },
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (Jameson)",
            summary = Some "Triple-distilled blended whiskey finished in double-charred first-fill bourbon barrels — sweeter and richer than standard Jameson, butter-toffee and vanilla-forward",
            nose = Some "Intensified butterscotch, fudge, creamy toffee, apricot, nectarine, peach, vanilla, hints of clove and honey",
            palate = Some "Nutty, smooth sweetness of spice and vanilla; honey, caramel, cask char, woody spice, nutmeg, cocoa",
            finish = Some "Richness of toasted wood and vanilla; warming spice; medium-short length"
          }
        ]
    }
