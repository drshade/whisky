let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "balvenie-doublewood-12",
      name = "Balvenie DoubleWood 12",
      producer = P.balvenie,
      style = W.Style.SingleMalt,
      abv = 40.0,
      age = Some 12,
      casks = [ "sherry finish" ],
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Medium,
        estPrice = "~€60",
        market = W.Market.NlEu,
        claudePick = True,
        why = "Honeyed, sherry-finished, well-rounded — a characterful mainstream pick that suits me."
      }
    }
