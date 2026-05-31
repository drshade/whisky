let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "compass-box-flaming-heart",
      name = "Compass Box Flaming Heart",
      producer = P.compassBox,
      style = W.Style.BlendedMalt,
      abv = 48.9,
      casks = [ "peat" ],
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Medium,
        estPrice = "~€120",
        market = "NL/EU",
        claudePick = True,
        tryFirst = True,
        why = "I click with Compass Box (Hedonism #1) — this is their peat + complexity flagship. Taste before buying."
      }
    }
