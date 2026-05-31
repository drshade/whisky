let W = ../schema/Whisky.dhall

let P = ../producers.dhall

in  W.Whisky::{
      id = "green-spot",
      name = "Green Spot",
      producer = P.midleton,
      style = W.Style.SinglePotStill,
      abv = 40.0,
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Benchmark,
        styleGroup = "Irish — single pot still",
        findability = W.Findability.Amber,
        note = "Lighter, orchard-fruit pot still; great everyday."
      }
    }
