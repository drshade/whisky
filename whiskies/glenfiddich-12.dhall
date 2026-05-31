let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "glenfiddich-12",
      name = "Glenfiddich 12",
      producer = P.glenfiddich,
      style = W.Style.SingleMalt,
      abv = 40.0,
      age = Some 12,
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Entry,
        theme = W.Theme.BrightSpeyside,
        findability = W.Findability.Green,
        note = "The textbook intro to bright Speyside."
      }
    }
