let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "powers-johns-lane",
      name = "Powers John's Lane 12",
      producer = P.midleton,
      style = W.Style.SinglePotStill,
      abv = 46.0,
      age = Some 12,
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Splurge,
        theme = W.Theme.IrishPotStill,
        findability = W.Findability.Amber,
        note = "Deeper, oilier, full-strength pot still."
      }
    }
