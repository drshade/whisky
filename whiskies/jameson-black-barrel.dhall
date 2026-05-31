let W = ../schema/Whisky.dhall

in  W.Whisky::{
      id = "jameson-black-barrel",
      name = "Jameson Black Barrel",
      classification = W.irish
        { producer = W.IrishProducer.Midleton, style = W.IrishStyle.Blend },
      abv = 40.0,
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Entry,
        styleGroup = "Irish — single pot still",
        findability = W.Findability.Green,
        note = "Easy, rich entry into the Irish idea."
      }
    }
