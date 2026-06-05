let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "amrut-fusion",
      name = "Amrut Fusion",
      producer = P.amrut,
      style = W.Style.SingleMalt,
      abv = 50.0,
      casks = [ "part-peated" ],
      externalNotes =
        [ W.ExternalNotes::{
            source = "Whisky Advocate + Jim Murray (97 pts, 3rd best 2010)",
            summary = Some "~75% unpeated Indian barley + ~25% peated Scottish malt; World Whisky of the Year 2011 — tropical climate drives rich, fast-maturing complexity",
            nose = Some "Peaches, mango, apricot, cinnamon, clove, Earl Grey tea, delicate floral smoke, toasted coconut, caramel, vanilla custard",
            palate = Some "Blood orange, mango, black pepper, cinnamon, dark fruits, honey, mocha, dark chocolate; peat integrated as campfire rather than medicinal",
            finish = Some "Long and balanced; spice and fruit linger, faint mintiness, oak drying; smoke is the last thing to leave"
          }
        ],
      wishlist = Some W.Wishlist::{
        priority = W.Priority.High,
        price = { amount = 42, currency = W.Currency.Eur },
        market = W.Market.NlEu,
        claudePick = True,
        why = "Opens world whisky — part-peated, rich and complex. Cult favourite."
      },
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Benchmark,
        theme = W.Theme.OtherWorld,
        findability = W.Findability.Amber,
        note = "Part-peated, rich and intense — a cult favourite."
      }
    }
