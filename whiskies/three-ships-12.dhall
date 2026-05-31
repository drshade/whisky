let W = ../schema/Whisky.dhall

in  W.Whisky::{
      id = "three-ships-12",
      name = "Three Ships 12",
      classification = W.world
        { country = W.WorldCountry.SouthAfrica,
          producer = "James Sedgwick",
          style = "Single malt (peated)"
        },
      abv = 46.3,
      age = Some 12,
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Medium,
        estPrice = "~€50",
        market = "NL/EU",
        why = "UK/EU export-only release — not on NL or SA shelves. Order from EU specialists that ship to NL; stock is intermittent, set an alert."
      }
    }
