let W = ../schema/Whisky.dhall

in  W.Whisky::{
      id = "powers-johns-lane",
      name = "Powers John's Lane 12",
      classification = W.irish
        { producer = W.IrishProducer.Midleton, style = W.IrishStyle.SinglePotStill },
      abv = 46.0,
      age = Some 12,
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Splurge,
        styleGroup = "Irish — single pot still",
        findability = W.Findability.Amber,
        note = "Deeper, oilier, full-strength pot still."
      }
    }
