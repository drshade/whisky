let W = ../schema/Whisky.dhall

let P = ../producers.dhall

in  W.Whisky::{
      id = "george-t-stagg",
      name = "George T. Stagg",
      producer = P.buffaloTrace,
      style = W.Style.Bourbon,
      abv = 65.0,
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Low,
        estPrice = "~R5000+",
        market = "NL/EU",
        claudePick = True,
        tryFirst = True,
        why = "The unicorn. Taste it if a bottle's open — you'll never buy one."
      }
    }
