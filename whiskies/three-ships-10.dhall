let W = ../schema/Whisky.dhall

in  W.Whisky::{
      id = "three-ships-10",
      name = "Three Ships 10",
      classification = W.world
        { country = W.WorldCountry.SouthAfrica,
          producer = "James Sedgwick",
          style = "Single malt"
        },
      abv = 43.0,
      age = Some 10,
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Medium,
        estPrice = "~R500 (SA)",
        market = "SA",
        claudePick = True,
        why = "The Three Ships single malt actually sold in SA (NGF). If I want a local Three Ships in JHB, this is the one — the 12yo is export-only."
      }
    }
