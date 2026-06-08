let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "ardbeg-uigeadail",
      name = "Ardbeg Uigeadail",
      producer = P.ardbeg,
      style = W.Style.SingleMalt,
      abv = 54.2,
      casks = [ "peat", "oloroso sherry" ],
      tasting = Some W.Tasting::{
        rating = 87,
        confidence = W.Confidence.Normal,
        summary = "peated medicinal bite on the nose with banana leaves and fresh-cut sweetness; palate is toffee, candy, liquorice, roasted sweet potato — smoke steps back and sherry leads; finish short but clean, steps aside happily",
        journal = Some "journal/2026-06-08-ardbeg-uigeadail.md"
      },
      ownership = Some W.Ownership::{
        status = W.Status.Open,
        paid = Some "~R1300",
        boughtWhere = Some "JHB trip, May 2026"
      },
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (Ardbeg)",
            summary = Some "Ex-bourbon and oloroso sherry casks at cask strength; World Whisky of the Year 2009 and 2012 — the defining smoke-meets-sherry expression",
            nose = Some "Christmas cake, walnut oil, parma violets, ocean spice, cedar, pine needles; treacle and bonfires beneath",
            palate = Some "Full, mouth-coating; sweet then winter spices then smoky-spicy explosion; honey-glazed smoked food, treacle, waves of deep smoky tones",
            finish = Some "Amazingly long and chewy; raisiny dark mocha tones and rich aromatic smoke into a perfectly integrated finish"
          }
        ]
    }
