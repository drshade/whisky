let W = ../schema/Whisky.dhall

let P = ../schema/producers.dhall

in  W.Whisky::{
      id = "springbank-10",
      name = "Springbank 10",
      producer = P.springbank,
      style = W.Style.SingleMalt,
      abv = 46.0,
      age = Some 10,
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Medium,
        estPrice = "~R1200",
        market = "NL/EU",
        claudePick = True,
        tryFirst = True,
        why = "The Campbeltown icon — oily, briny, dunnage funk. Allocated, so taste before chasing a bottle."
      },
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Splurge,
        styleGroup = "Campbeltown",
        findability = W.Findability.Red,
        note = "The icon — briny, oily, dunnage funk. Allocated, grab on sight."
      }
    }
