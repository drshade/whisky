let W = ../schema/Whisky.dhall

in  W.Whisky::{
      id = "glenfarclas-105",
      name = "Glenfarclas 105",
      classification = W.scotchSingleMalt W.ScotchDistillery.Glenfarclas,
      abv = 60.0,
      casks = [ "sherry" ],
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Medium,
        estPrice = "~R1100",
        market = "NL/EU",
        claudePick = True,
        why = "Cask-strength sherry bomb; a cheaper A'bunadh alternative worth comparing."
      }
    }
