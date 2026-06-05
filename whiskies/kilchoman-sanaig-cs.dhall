let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "kilchoman-sanaig-cs",
      name = "Kilchoman Sanaig CS",
      producer = P.kilchoman,
      style = W.Style.SingleMalt,
      abv = 57.8,
      casks = [ "ex-bourbon", "oloroso sherry" ],
      ownership = Some W.Ownership::{ status = W.Status.Open },
      tasting = Some W.Tasting::{
        rating = 90,
        confidence = W.Confidence.Normal,
        summary = "intense, spicy sipper",
        journal = Some "journal/2026-05-29-kilchoman-sanaig-cs.md"
      },
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (Kilchoman)",
            summary = Some "Oloroso sherry recipe at full cask strength — intense peat smoke, rich fruit, and sherry sweetness; rewards patience and water",
            nose = Some "Fragrant heather, raisins, pear, orange peel, stone fruits, mixed spices, rich peat smoke, prunes, figs, toffee",
            palate = Some "Rich peat smoke, cinnamon, stone fruits, citrus, dark chocolate, blackberries, plums, pepper, nutmeg",
            finish = Some "Long — dark fruits, liquorice, sweetness and spice; ashy and dry"
          }
        ]
    }
