let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "three-ships-6-chenin",
      name = "Three Ships 6 Chenin",
      producer = P.jamesSedgwick,
      style = W.Style.SingleMalt,
      abv = 43.0,
      age = Some 6,
      casks = [ "chenin blanc finish" ],
      ownership = Some W.Ownership::{
        status = W.Status.Sealed,
        paid = Some "R699",
        boughtWhere = Some "JHB trip, May 2026"
      },
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (Three Ships)",
            summary = Some "4yr American oak then 2yr Chenin Blanc wine cask finish; distinctive bright tropical fruit and citrus over classic oak base — standout SA wine-cask expression",
            nose = Some "Lemon cream biscuits, tropical fruit, rooibos tea, hay, subtle honey sweetness",
            palate = Some "Golden Delicious apples, candied pineapple, subtle pepper, lemon zest",
            finish = Some "Warm, fragrant, lingering soft spice with fruity tones"
          }
        ]
    }
