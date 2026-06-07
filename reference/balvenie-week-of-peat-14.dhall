let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "balvenie-week-of-peat-14",
      name = "Balvenie 14 Week of Peat",
      producer = P.balvenie,
      style = W.Style.SingleMalt,
      abv = 48.3,
      age = Some 14,
      casks = [ "american oak" ],
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (Balvenie)",
            summary = Some "Stories range — distilled from Highland-peated malt made in the distillery's one peat week per year; Speyside honey meets gentle smoke",
            nose = Some "Gentle sweet peat smoke, lighter floral notes and delicate butterscotch honey",
            palate = Some "Velvety and round; peat smoke balancing citrus, oaky vanilla and blossom honey",
            finish = Some "Gentle smoke with a lingering, creamy vanilla sweetness"
          }
        ]
    }
