let W = ../schema/Whisky.dhall

in  W.Whisky::{
      id = "glendronach-15",
      name = "GlenDronach 15 Revival",
      classification = W.scotchSingleMalt W.ScotchDistillery.GlenDronach,
      abv = 46.0,
      age = Some 15,
      casks = [ "sherry" ],
      wishlist = Some W.Wishlist::{
        priority = W.Priority.High,
        estPrice = "~R1300",
        market = "NL/EU",
        claudePick = True,
        why = "Deep dried-fruit sherry; sweetness + complexity bullseye."
      }
    }
