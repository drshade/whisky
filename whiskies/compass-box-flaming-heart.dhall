let W = ../schema/Whisky.dhall

in  W.Whisky::{
      id = "compass-box-flaming-heart",
      name = "Compass Box Flaming Heart",
      classification = W.scotchBlendedMalt W.ScotchBlender.CompassBox,
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
