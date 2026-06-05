let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "octomore",
      name = "Octomore",
      producer = P.bruichladdich,
      style = W.Style.SingleMalt,
      abv = 59.0,
      casks = [ "heavy peat" ],
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (Bruichladdich, 15.1) + Whisky Advocate",
            summary = Some "World's most peated whisky (15.1: 108.2 PPM) in first-fill and re-charred ex-bourbon; 'raw and uncompromising yet sleek and elegant' — smoke integrated, never blunt",
            nose = Some "Caramel, vibrant citrus, dry earthy peat smoke, spicy aniseed, vanilla custard, tropical fruit; sardines in brine, kelp, dry earth, beetroot sweetness, salt, lemon",
            palate = Some "Immediate heat then sweet dry malt, earthy smoke, mango, banana, apricot jam, vanilla, toffee; smoke, white pepper, crème brûlée; Arbroath smokies, cloves",
            finish = Some "Peat smoke, vanilla, sweet charred oak, fresh marine crispness; long, smoky, sweet-and-salty interplay"
          }
        ],
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Low,
        price = { amount = 160, currency = W.Currency.Eur },
        market = W.Market.NlEu,
        claudePick = True,
        tryFirst = True,
        why = "Most heavily-peated whisky made — a complexity and intensity experiment. Taste-only at this price."
      }
    }
