let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "compass-box-crimson-casks",
      name = "Crimson Casks",
      producer = P.compassBox,
      style = W.Style.BlendedMalt,
      abv = 46.0,
      tasting = Some W.Tasting::{
        rating = 86,
        confidence = W.Confidence.Normal,
        summary = "pepper, liquorice, chilli, salt, tiny hint of smoke; very dry red wine palate, very little sweetness; oily thick finish with toffee — moreish; surprisingly enjoyable despite leaning dry rather than sweet"
      },
      ownership = Some W.Ownership::{
        status = W.Status.Open,
        boughtWhere = Some "Work trip, May 2026"
      },
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (Compass Box) + Dram1 (10/10)",
            summary = Some "American oak oloroso sherry butts — intensely chocolate, plum and red fruit-forward; described as 'dessert whisky with muscle'",
            nose = Some "Chocolate fudge cake, clove, cardamom, plum jam, redcurrant jelly; sticky brownies, cranberry, hazelnut, espresso, blackcurrant",
            palate = Some "Chocolate fudge cake, clove, cardamom, plum jam, cherry, toffee, oak; pomegranate, molasses, rum raisins, dates, port reduction",
            finish = Some "Raisin, honey, brown sugar; long and warming with rooibos tea, candied cherries, cinnamon heat"
          }
        ]
    }
