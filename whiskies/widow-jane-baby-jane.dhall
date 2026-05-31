let W = ../schema/Whisky.dhall

in  W.Whisky::{
      id = "widow-jane-baby-jane",
      name = "Baby Jane",
      classification = W.american
        { producer = W.AmericanProducer.WidowJane,
          mash = W.MashType.Corn,
          bottledInBond = False,
          singleBarrel = False
        },
      abv = 45.5,
      ownership = Some W.Ownership::{ status = W.Status.Open },
      tasting = Some W.Tasting::{
        rating = 80,
        confidence = W.Confidence.Low,
        summary = "premium, underwhelming",
        journal = Some "journal/2026-05-29-widow-jane-baby-jane.md"
      }
    }
