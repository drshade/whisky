let W = ../schema/Whisky.dhall

in  W.Whisky::{
      id = "aberlour-abunadh",
      name = "Aberlour A'bunadh",
      classification = W.scotchSingleMalt W.ScotchDistillery.Aberlour,
      abv = 60.0,
      casks = [ "oloroso sherry" ],
      wishlist = Some W.Wishlist::{
        priority = W.Priority.High,
        estPrice = "~R1300",
        market = "NL/EU",
        why = "Best off-shelf profile match: cask-strength oloroso sherry bomb = sweetness + complexity + earned strength. Fills the sherried-Speyside gap."
      }
    }
