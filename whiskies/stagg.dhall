let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "stagg",
      name = "Stagg",
      producer = P.buffaloTrace,
      style = W.Style.Bourbon,
      abv = 65.0,
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Low,
        estPrice = "~€80+",
        market = "NL/EU",
        claudePick = True,
        why = "Barrel-proof intensity & complexity (ex-'Stagg Jr', NOT George T. Stagg). Allocated/pricey even in EU — a grab-on-sight, not a planned buy."
      }
    }
