let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "springbank-10",
      name = "Springbank 10",
      producer = P.springbank,
      style = W.Style.SingleMalt,
      abv = 46.0,
      age = Some 10,
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (Springbank)",
            summary = Some "Bourbon and sherry casks, 46% — complex yet balanced; lightly peated with maritime character and both sweet and savoury notes",
            nose = Some "Milk chocolate, cornflakes, heather honey, mango, red apple, caramel; gentle peat smoke threaded through",
            palate = Some "Honeycomb, icing sugar, crystallised ginger, demerara sugar, brine and salt; salted caramel character",
            finish = Some "Peat smoke carries through with eucalyptus, mint and gorse"
          }
        ],
      tasting = Some W.Tasting::{
        rating = 88,
        confidence = W.Confidence.Normal,
        summary = "thick and full-bodied; not sweet — umami and soy sauce, dark caramel, pear, overripe banana, a Sauvignon Blanc minerality; long tongue-coating finish with a mild anaesthetic burn. Not an all-day drinker but genuinely special — the one to pour when you want something interesting",
        journal = Some "journal/2026-08-11-springbank-10.md"
      },
      ownership = Some W.Ownership::{
        status = W.Status.Open,
        paid = Some "€69",
        boughtWhere = Some "acedrinks.nl",
        boughtWhen = Some "2026-08-08"
      },
      wishlist = Some W.Wishlist::{
        priority = W.Priority.High,
        price = { amount = 90, currency = W.Currency.Eur },
        market = W.Market.NlEu,
        claudePick = True,
        tryFirst = True,
        why = "The Campbeltown icon — oily, briny, dunnage funk. Allocated, so taste before chasing a bottle."
      },
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Splurge,
        theme = W.Theme.CampbeltownMalts,
        findability = W.Findability.Red,
        note = "The icon — briny, oily, dunnage funk. Allocated, grab on sight."
      }
    }
