let W = ../schema/Whisky.dhall

in  W.Whisky::{
      id = "glen-scotia-double-cask",
      name = "Glen Scotia Double Cask",
      classification = W.scotchSingleMalt W.ScotchDistillery.GlenScotia,
      abv = 46.0,
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Entry,
        styleGroup = "Campbeltown",
        findability = W.Findability.Amber,
        note = "Easiest Campbeltown to find; salty, vanilla, gentle."
      }
    }
