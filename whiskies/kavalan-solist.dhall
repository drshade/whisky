let W = ../schema/Whisky.dhall

in  W.Whisky::{
      id = "kavalan-solist",
      name = "Kavalan Solist",
      classification = W.world
        { country = W.WorldCountry.Taiwan,
          producer = "Kavalan",
          style = "Single malt (single cask)"
        },
      abv = 57.0,
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Splurge,
        styleGroup = "Other world whisky",
        findability = W.Findability.Red,
        note = "Single-cask, lush tropical fruit; the splurge."
      }
    }
