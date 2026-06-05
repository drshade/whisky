let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "wild-turkey-rare-breed",
      name = "Wild Turkey Rare Breed",
      producer = P.wildTurkey,
      style = W.Style.Bourbon,
      abv = 58.4,
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (Wild Turkey) + Breaking Bourbon",
            summary = Some "Small-batch blend of 6, 8 and 12yr barrels at barrel proof, no filtration — rich caramel, spice, oak and citrus; the finish is considered the highlight",
            nose = Some "Spring flowers, black pepper, almonds, honey, dates; caramel, toffee, orange zest, dark chocolate",
            palate = Some "Warm smoky grain and spice with intense vanilla; rye spice, maple sugar, caramel, leather, clementine, tobacco",
            finish = Some "Long lingering spice; caramel, leather, tobacco, orange zest, toffee, burnt brown sugar; considered the highlight of the pour"
          }
        ],
      wishlist = Some W.Wishlist::{
        priority = W.Priority.High,
        price = { amount = 50, currency = W.Currency.Eur },
        market = W.Market.NlEu,
        claudePick = True,
        why = "The easy, available complex-bourbon buy in NL/EU — barrel-strength, rich, great value. Best first answer to my 'complex bourbon' gap."
      }
    }
