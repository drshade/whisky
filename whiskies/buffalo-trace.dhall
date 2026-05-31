let W = ../schema/Whisky.dhall

in  W.Whisky::{
      id = "buffalo-trace",
      name = "Buffalo Trace",
      classification = W.american
        { producer = W.AmericanProducer.BuffaloTrace,
          mash = W.MashType.Bourbon,
          bottledInBond = False,
          singleBarrel = False
        },
      abv = 45.0,
      ownership = Some W.Ownership::{ status = W.Status.Open },
      tasting = Some W.Tasting::{
        rating = 82,
        confidence = W.Confidence.Normal,
        summary = "mixer / boulevardiers",
        journal = Some "journal/2026-05-29-buffalo-trace.md"
      }
    }
