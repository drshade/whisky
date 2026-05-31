let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "larceny-barrel-proof",
      name = "Larceny Barrel Proof",
      producer = P.heavenHill,
      style = W.Style.Wheated,
      abv = 62.0,
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Medium,
        estPrice = "~€90",
        market = "NL/EU",
        claudePick = True,
        why = "Wheated barrel-proof — sweeter + strong + layered (all my levers). Allocated/pricey but gettable via EU specialists."
      }
    }
