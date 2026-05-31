let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "kavalan-solist",
      name = "Kavalan Solist",
      producer = P.kavalan,
      style = W.Style.SingleMalt,
      abv = 57.0,
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Splurge,
        styleGroup = "Other world whisky",
        findability = W.Findability.Red,
        note = "Single-cask, lush tropical fruit; the splurge."
      }
    }
