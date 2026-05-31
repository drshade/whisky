let W = ../schema/Whisky.dhall

let P = ../schema/producers.dhall

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
      }
    }
