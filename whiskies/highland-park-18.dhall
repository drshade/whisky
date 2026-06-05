let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "highland-park-18",
      name = "Highland Park 18",
      producer = P.highlandPark,
      style = W.Style.SingleMalt,
      abv = 43.0,
      age = Some 18,
      casks = [ "sherry" ],
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (Highland Park)",
            summary = Some "First-fill sherry European oak with American oak and refill casks — HP's most-awarded expression; deep, fruity, complex with heather honey and restrained peat",
            nose = Some "Butterscotch, toffee, orange peel, heather honey, peppercorns, subtle peat smoke, autumn leaves, herbal tea",
            palate = Some "Toffee, mature oak, honey, marmalade, coffee, dark chocolate, nutmeg, roasted rosemary, ginger, leather",
            finish = Some "Long; mild smoke, herbal notes, chocolate-coated raisins, dark chocolate, cracked black pepper"
          }
        ],
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Medium,
        price = { amount = 140, currency = W.Currency.Eur },
        market = W.Market.NlEu,
        claudePick = True,
        tryFirst = True,
        why = "Honey + gentle peat + sherry, beautifully complex — strong fit. But above budget, so taste first; buy if it wows."
      }
    }
