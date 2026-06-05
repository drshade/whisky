let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "larceny-small-batch",
      name = "Larceny Small Batch",
      producer = P.heavenHill,
      style = W.Style.Wheated,
      abv = 46.0,
      externalNotes =
        [ W.ExternalNotes::{
            source = "The Whiskey Shelf + Breaking Bourbon",
            summary = Some "Approachable everyday wheated bourbon; nose outperforms palate in complexity; excellent value at ~$25-30, noticeably softer than the Barrel Proof",
            nose = Some "Sweet caramel, nougat, floral and grassy notes; peanut shells, dried grass, hay, charred wood, orange rind, dried cranberries, bread, peanut butter with honey",
            palate = Some "Caramel sweetness with nuttiness and grassiness; peach, citrus, cinnamon, pepper, spiced peach tea; bread, milk chocolate, orange zest, apricot",
            finish = Some "Medium-short; brown sugar, mild oak, vanilla; tingling nutmeg; peach juice and light wood char"
          }
        ],
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Benchmark,
        theme = W.Theme.WheatedBourbon,
        findability = W.Findability.Amber,
        note = "More of the same as Maker's, a touch richer; great value."
      }
    }
