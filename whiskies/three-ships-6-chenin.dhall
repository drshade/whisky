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
      tasting = Some W.Tasting::{
        rating = 83,
        confidence = W.Confidence.Low,
        summary = "sweet and rich — nectarine and apricot on the nose with liquorice and blackberry; palate is blackberry and black wine gums with an underlying savoury note, marmite-adjacent; reads sherried but there is no sherry in it, so the richness is Chenin cask + American oak. No smoke and no funk at all — clean and fruit-driven. Really good, just short of the top tier on complexity",
        journal = Some "journal/2026-08-11-three-ships-6-chenin.md"
      },
      ownership = Some W.Ownership::{
        status = W.Status.Open,
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
