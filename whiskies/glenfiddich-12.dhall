let W = ../schema/Whisky.dhall

in  W.Whisky::{
      id = "glenfiddich-12",
      name = "Glenfiddich 12",
      classification = W.scotchSingleMalt W.ScotchDistillery.Glenfiddich,
      abv = 40.0,
      age = Some 12,
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Entry,
        styleGroup = "Speyside — bright & ex-bourbon",
        findability = W.Findability.Green,
        note = "The textbook intro to bright Speyside."
      }
    }
