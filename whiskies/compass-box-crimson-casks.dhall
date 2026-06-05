let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "compass-box-crimson-casks",
      name = "Crimson Casks",
      producer = P.compassBox,
      style = W.Style.BlendedMalt,
      abv = 46.0,
      ownership = Some W.Ownership::{
        status = W.Status.Sealed,
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
