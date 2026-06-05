let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "whistlepig-10",
      name = "WhistlePig 10",
      producer = P.whistlePig,
      style = W.Style.Rye,
      abv = 50.0,
      age = Some 10,
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (WhistlePig) + Wine Enthusiast (96 pts)",
            summary = Some "100% rye, 10yr, 50% — WhistlePig's flagship 'Quintessential Rye'; spice-forward, complex and versatile; 96 pts Wine Enthusiast",
            nose = Some "Allspice, orange peel, anise, oak, char and caramel",
            palate = Some "Sweet — caramel and vanilla upfront, followed by rye spice and mint",
            finish = Some "Long; warm butterscotch and caramel"
          }
        ],
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Splurge,
        theme = W.Theme.RyeWhiskey,
        findability = W.Findability.Amber,
        note = "100% rye, polished and premium."
      }
    }
