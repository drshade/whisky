let W = ../schema/Whisky.dhall

in  W.Whisky::{
      id = "nikka-coffey-grain",
      name = "Nikka Coffey Grain",
      classification = W.japanese
        { producer = W.JapaneseProducer.Nikka, style = W.JapaneseStyle.SingleGrain },
      abv = 45.0,
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Entry,
        styleGroup = "Japanese",
        findability = W.Findability.Amber,
        note = "Lush grain whisky — a natural step from your love of Hedonism."
      }
    }
