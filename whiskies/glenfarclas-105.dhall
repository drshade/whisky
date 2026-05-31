let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "glenfarclas-105",
      name = "Glenfarclas 105",
      producer = P.glenfarclas,
      style = W.Style.SingleMalt,
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
