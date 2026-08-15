let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "glenlivet-15",
      name = "Glenlivet 15 French Oak Reserve",
      producer = P.glenlivet,
      style = W.Style.SingleMalt,
      abv = 40.0,
      age = Some 15,
      casks = [ "ex-bourbon", "new French Limousin oak (part)" ],
      tasting = Some W.Tasting::{
        rating = 80,
        confidence = W.Confidence.Low,
        summary = "very plain and smooth — nice but not much character, really inoffensive with nothing particularly interesting going on. Sampled on holiday in the heat: half neat, then over ice. Not a proper tasting",
        journal = Some "journal/2026-08-14-glenlivet-15.md"
      },
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (The Glenlivet) + Whiskybase (81.7 from 785 ratings)",
            summary = Some "Ex-bourbon American oak with a portion finished in new French Limousin oak (the cognac wood); 40%, chill-filtered and coloured. Whisky Advocate ~87, unconfirmed — two review entries exist for different generations",
            nose = Some "Rich toffee, dark chocolate, ginger-spiced biscuits; older copy cites butter, caramel and whipped cream",
            palate = Some "Fruity and nutty — ripe mango, warming cinnamon spice, almond; older copy cites baked apples and cinnamon",
            finish = Some "Warm, mellow and spiced; almonds, nutmeg and pie crust in the older notes"
          }
        ]
    }
