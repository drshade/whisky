let W = ../schema/Whisky.dhall

in  W.Whisky::{
      id = "green-spot",
      name = "Green Spot",
      classification = W.irish
        { producer = W.IrishProducer.Midleton, style = W.IrishStyle.SinglePotStill },
      abv = 40.0,
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Benchmark,
        styleGroup = "Irish — single pot still",
        findability = W.Findability.Amber,
        note = "Lighter, orchard-fruit pot still; great everyday."
      }
    }
