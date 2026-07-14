let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "wayne-gretzky-red-cask",
      name = "Wayne Gretzky No. 99 Red Cask",
      producer = P.wayneGretzky,
      style = W.Style.Blend,
      abv = 40.0,
      casks = [ "ex-bourbon", "red wine" ],
      tasting = Some W.Tasting::{
        rating = 65,
        confidence = W.Confidence.Normal,
        summary = "cheap and fiery, no real flavour notes — young, unmatured base overwhelms any character; possibly better as a mixer"
      },
      ownership = Some W.Ownership::{
        status = W.Status.Open,
        boughtWhere = Some "Gift from Shane (emigrating)"
      },
      externalNotes =
        [ W.ExternalNotes::{
            source = "Whisky Advocate (87 pts) + WhiskyCast (88 pts)",
            summary = Some "NAS Canadian blend, red wine cask finish; minimum 3 years ex-bourbon then finished in Wayne Gretzky's own winery casks; ~$37 CAD",
            nose = Some "Toasted almond, caramel, vanilla, light spice, red grapes, raspberry jam",
            palate = Some "Smooth and rounded; marzipan, light citrus, vanilla, oak, spice, raspberry jam, honey, red grape",
            finish = Some "Long, warming, balanced; red grape, oak, floral"
          }
        ]
    }
