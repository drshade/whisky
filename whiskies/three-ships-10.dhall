let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "three-ships-10",
      name = "Three Ships 10",
      producer = P.jamesSedgwick,
      style = W.Style.SingleMalt,
      abv = 43.0,
      age = Some 10,
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (James Sedgwick) + Wild About Whisky",
            summary = Some "Award-winning SA single malt, 10yr American oak, 46.3% — sweet vanilla and tropical fruit with subtle smoky backbone",
            nose = Some "White pepper, digestive biscuits, gentle caramel, vanilla, honey, citrus, pear, mango, pineapple",
            palate = Some "Rich vanilla and toffee with tropical fruit, spice and lingering smokiness in the background",
            finish = Some "Sweet oak, spicy nuttiness and warm peat; long and lightly silky"
          }
        ],
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Medium,
        price = { amount = 500, currency = W.Currency.Zar },
        market = W.Market.Sa,
        claudePick = True,
        why = "The Three Ships single malt actually sold in SA (NGF). If I want a local Three Ships in JHB, this is the one — the 12yo is export-only."
      }
    }
