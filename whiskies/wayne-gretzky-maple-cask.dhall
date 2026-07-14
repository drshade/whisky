let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "wayne-gretzky-maple-cask",
      name = "Wayne Gretzky No. 99 Maple Cask",
      producer = P.wayneGretzky,
      style = W.Style.Blend,
      abv = 40.0,
      casks = [ "ex-bourbon", "maple syrup" ],
      tasting = Some W.Tasting::{
        rating = 70,
        confidence = W.Confidence.Normal,
        summary = "same cheap fiery base as the Red Cask but with a definite maple syrup note; alcohol overwhelms, sweetness never really lands; saved slightly by the maple character"
      },
      ownership = Some W.Ownership::{
        status = W.Status.Open,
        boughtWhere = Some "Gift from Shane (emigrating)"
      },
      externalNotes =
        [ W.ExternalNotes::{
            source = "WhiskyCast (91 pts) + Canadian Whisky Awards Gold 2024 & 2026",
            summary = Some "NAS Canadian blend, maple syrup barrel finish; 100% Ontario rye and corn mash; Blended Whisky of the Year CWA 2024 and 2026; ~$35 CAD",
            nose = Some "Toffee, maple candy, vanilla spice, caramel, honey, warm baking spices, oak, toasted nut, dried fruit",
            palate = Some "Delicately sweet and rounded; butterscotch, maple, vanilla, dried citrus",
            finish = Some "Long and warming with lingering maple sweetness and spice"
          }
        ]
    }
