let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "glenfiddich-12",
      name = "Glenfiddich 12",
      producer = P.glenfiddich,
      style = W.Style.SingleMalt,
      abv = 40.0,
      age = Some 12,
      externalNotes =
        [ W.ExternalNotes::{
            source = "The Whiskey Wash + Drinkhacker (2025)",
            summary = Some "Ex-bourbon and ex-sherry oak, 40% — the world's best-selling malt; 'masterfully balanced session malt that prioritizes consistency and drinkability' over complexity",
            nose = Some "Crisp green pear, fresh apple, honeysuckle, fresh-cut grass, vanilla, honeyed cereal, malted milk biscuits, light citrus",
            palate = Some "Smooth and mellow; pear, creamy butterscotch, honey porridge, apple cobbler, caramel, malt, mild cinnamon oak",
            finish = Some "Medium and clean; sweet malt, soft dried fruit, whisper of hazelnut; bittersweet"
          }
        ],
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Entry,
        theme = W.Theme.BrightSpeyside,
        findability = W.Findability.Green,
        note = "The textbook intro to bright Speyside."
      }
    }
