let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "macallan-15",
      name = "Macallan 15",
      producer = P.macallan,
      style = W.Style.SingleMalt,
      abv = 43.0,
      age = Some 15,
      casks = [ "sherry" ],
      tasting = Some W.Tasting::{
        rating = 86,
        confidence = W.Confidence.Low,
        summary = "sherried, rich — landed well, but hazy/pre-serious memory; brand-premium (revisit)",
        journal = Some "journal/2026-02-15-macallan-15.md"
      },
      externalNotes =
        [ W.ExternalNotes::{
            source = "Whisky Advocate (94 pts, Top 20 of 2020)",
            summary = Some "Sherry-seasoned American and European oak; benchmark sherried Speyside — richly nutty and fruity, luscious and supple, impressively complex",
            nose = Some "Dried fruit, butterscotch, baked apples, chocolate, smooth oak; dried apples, cherries and prunes (WA)",
            palate = Some "Sweet raisin and sultana, cinnamon, nutmeg, creamy vanilla; mouth-coating waves of fruit (WA)",
            finish = Some "Medium with lingering oak and spice; long warming farewell (WA)"
          }
        ]
    }
