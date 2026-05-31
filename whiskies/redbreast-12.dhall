let W = ../schema/Whisky.dhall

in  W.Whisky::{
      id = "redbreast-12",
      name = "Redbreast 12",
      classification = W.irish
        { producer = W.IrishProducer.Midleton, style = W.IrishStyle.SinglePotStill },
      abv = 40.0,
      age = Some 12,
      casks = [ "ex-bourbon", "oloroso sherry" ],
      tasting = Some W.Tasting::{
        rating = 85,
        confidence = W.Confidence.Low,
        summary = "sherried, well-rounded; balanced not deep — confirmed buy",
        journal = Some "journal/2026-05-30-redbreast-12.md"
      },
      wishlist = Some W.Wishlist::{
        priority = W.Priority.High,
        estPrice = "~R600",
        market = "NL/EU",
        claudePick = True,
        why = "Opens Irish pot still — lush, sherried, complex. Sampled at dinner, confirmed buy."
      },
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Benchmark,
        styleGroup = "Irish — single pot still",
        findability = W.Findability.Green,
        note = "The pot-still benchmark — sherried, lush, a must-try."
      }
    }
