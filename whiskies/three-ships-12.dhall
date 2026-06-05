let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "three-ships-12",
      name = "Three Ships 12",
      producer = P.jamesSedgwick,
      style = W.Style.SingleMalt,
      abv = 46.3,
      age = Some 12,
      externalNotes =
        [ W.ExternalNotes::{
            source = "A Scot on Scotch + Whisky Saga",
            summary = Some "More wood presence, pepper and smoke than the 10yr; dry cereal-forward nose giving way to peppery, oaky palate — noticeably more assertive expression",
            nose = Some "Corn, cereals, straw, heather honey, fresh fruit, vanilla, fresh oak, soft fragrant smoke, pear, apple pastry",
            palate = Some "Caramel, oak, runny honey, nutty, prickly white pepper, prominent new wood, malted barley",
            finish = Some "Pepper lingers; oak and peat smoke shift toward ashy; medium-long with mildly bitter wood edge"
          }
        ],
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Medium,
        price = { amount = 50, currency = W.Currency.Eur },
        market = W.Market.NlEu,
        why = "UK/EU export-only release — not on NL or SA shelves. Order from EU specialists that ship to NL; stock is intermittent, set an alert."
      }
    }
