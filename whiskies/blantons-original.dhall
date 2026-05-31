let W = ../schema/Whisky.dhall

in  W.Whisky::{
      id = "blantons-original",
      name = "Blanton's Original",
      classification = W.american
        { producer = W.AmericanProducer.BuffaloTrace,
          mash = W.MashType.Bourbon,
          bottledInBond = False,
          singleBarrel = True
        },
      abv = 46.5,
      ownership = Some W.Ownership::{ status = W.Status.Open },
      tasting = Some W.Tasting::{
        rating = 89,
        confidence = W.Confidence.Normal,
        summary = "the bourbon that transcends",
        journal = Some "journal/2026-05-29-blantons-original.md"
      }
    }
