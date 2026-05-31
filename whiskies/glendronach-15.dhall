let W = ../schema/Whisky.dhall

let P = ../schema/producers.dhall

in  W.Whisky::{
      id = "glendronach-15",
      name = "GlenDronach 15 Revival",
      producer = P.glendronach,
      style = W.Style.SingleMalt,
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
