let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "balvenie-doublewood-12",
      name = "Balvenie DoubleWood 12",
      producer = P.balvenie,
      style = W.Style.SingleMalt,
      abv = 40.0,
      age = Some 12,
      casks = [ "sherry finish" ],
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (Balvenie) + The Whiskey Wash",
            summary = Some "~10yr ex-bourbon then 9-12 months in first-fill oloroso sherry butts — gentle, approachable Speyside; benchmark introduction to Scotch",
            nose = Some "Honey, sultanas, grapes, fresh stone fruit, vanilla, honeysuckle, sweet almond, banana, fresh cereal",
            palate = Some "Sweet and smooth; sherry dried fruit, nuts, nutmeg, cinnamon, bourbon vanilla; butterscotch, caramel, light oak",
            finish = Some "Spicy and slightly drying, still sweet; medium length; soft dried fruit, subtle smoke, dried coconut, orange peel"
          }
        ],
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Medium,
        price = { amount = 60, currency = W.Currency.Eur },
        market = W.Market.NlEu,
        claudePick = True,
        why = "Honeyed, sherry-finished, well-rounded — a characterful mainstream pick that suits me."
      }
    }
