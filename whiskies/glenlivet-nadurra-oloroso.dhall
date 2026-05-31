let W = ../schema/Whisky.dhall

in  W.Whisky::{
      id = "glenlivet-nadurra-oloroso",
      name = "Glenlivet Nàdurra Oloroso",
      classification = W.scotchSingleMalt W.ScotchDistillery.Glenlivet,
      abv = 60.0,
      casks = [ "oloroso sherry" ],
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Medium,
        estPrice = "~€70",
        market = "NL/EU",
        claudePick = True,
        why = "The Glenlivet worth owning — cask-strength, sherried, NCF, great value. Skip the 12; this fits."
      }
    }
