let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "kilkerran-12",
      name = "Kilkerran 12",
      producer = P.glengyle,
      style = W.Style.SingleMalt,
      abv = 46.0,
      age = Some 12,
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (Kilkerran) + Whisky Advocate (93 pts)",
            summary = Some "Lightly peated Campbeltown malt, 70% bourbon 30% sherry casks — characteristic oiliness with citrus, gentle peat and sweet-spicy complexity",
            nose = Some "Turkish delight, pear drops, marzipan; subtle peat smoke like toasted marshmallows by a campfire",
            palate = Some "Lemon cheesecake, Campbeltown oiliness, peat smoke, leather-bound books, peppery spice; sticky toffee pudding develops",
            finish = Some "Campfire embers carrying peat smoke; pecan pie and butterscotch"
          }
        ],
      tasting = Some W.Tasting::{
        rating = 88,
        confidence = W.Confidence.Normal,
        summary = "sweet nose with a metallic undertone — bright, floral and rosy, caramel flecks, tart apple and pear; funk (rotten bin, pleasantly) sits in the vapour right at the approach; palate sweet upfront then dry at the back, Sauvignon Blanc minerality again, less oily than the Springbank; smooth numbing finish that doesn't linger. Tied with Springbank 10 — charm and brightness against the Springbank's body",
        journal = Some "journal/2026-08-11-kilkerran-12.md"
      },
      ownership = Some W.Ownership::{
        status = W.Status.Open,
        paid = Some "€57.99",
        boughtWhere = Some "acedrinks.nl",
        boughtWhen = Some "2026-08-08"
      },
      wishlist = Some W.Wishlist::{
        priority = W.Priority.High,
        price = { amount = 60, currency = W.Currency.Eur },
        market = W.Market.NlEu,
        claudePick = True,
        why = "Opens Campbeltown — oily, fruity, light smoke, loads of character."
      },
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Benchmark,
        theme = W.Theme.CampbeltownMalts,
        findability = W.Findability.Amber,
        note = "Superb balance of fruit, oil and light smoke."
      }
    }
