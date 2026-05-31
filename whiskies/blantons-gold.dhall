let W = ../schema/Whisky.dhall

in  W.Whisky::{
      id = "blantons-gold",
      name = "Blanton's Gold",
      classification = W.american
        { producer = W.AmericanProducer.BuffaloTrace,
          mash = W.MashType.Bourbon,
          bottledInBond = False,
          singleBarrel = True
        },
      abv = 51.5,
      ownership = Some W.Ownership::{ status = W.Status.Open },
      tasting = Some W.Tasting::{
        rating = 84,
        confidence = W.Confidence.Normal,
        summary = "strong but harsh",
        journal = Some "journal/2026-05-29-blantons-gold-edition.md"
      }
    }
