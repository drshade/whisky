let W = ../schema/Whisky.dhall

let P = ../producers.dhall

in  W.Whisky::{
      id = "bains-cape-mountain",
      name = "Bain's Cape Mountain",
      producer = P.jamesSedgwick,
      style = W.Style.SingleGrain,
      abv = 43.0,
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Medium,
        estPrice = "~R250 (SA)",
        market = "SA",
        claudePick = True,
        why = "SA-trip buy — award-winning local single grain, great value. But sweet & simple/easy, NOT complex like Hedonism — a cheap low-risk curiosity, not a wow."
      }
    }
