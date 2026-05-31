let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "amrut-fusion",
      name = "Amrut Fusion",
      producer = P.amrut,
      style = W.Style.SingleMalt,
      abv = 50.0,
      casks = [ "part-peated" ],
      wishlist = Some W.Wishlist::{
        priority = W.Priority.High,
        estPrice = "~R800",
        market = W.Market.NlEu,
        claudePick = True,
        why = "Opens world whisky — part-peated, rich and complex. Cult favourite."
      },
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Benchmark,
        styleGroup = "Other world whisky",
        findability = W.Findability.Amber,
        note = "Part-peated, rich and intense — a cult favourite."
      }
    }
