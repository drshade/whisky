let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "hibiki-harmony",
      name = "Hibiki Harmony",
      producer = P.suntory,
      style = W.Style.Blend,
      abv = 43.0,
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (House of Suntory)",
            summary = Some "Yamazaki, Hakushu and Chita grain blend — elegant, floral, sweetly layered with distinctive Mizunara oak spice on the finish",
            nose = Some "Rose, lychee, hint of rosemary, mature woodiness, sandalwood",
            palate = Some "Honey-like sweetness, candied orange peel, white chocolate",
            finish = Some "Subtle, tender, long — with a hint of Mizunara (Japanese oak)"
          }
        ],
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Medium,
        price = { amount = 80, currency = W.Currency.Eur },
        market = W.Market.NlEu,
        claudePick = True,
        tryFirst = True,
        why = "Attainable Japanese blend. (Hakushu 12 is the malt benchmark but usually > budget.) Taste before chasing."
      }
    }
