let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "bains-cape-mountain",
      name = "Bain's Cape Mountain",
      producer = P.jamesSedgwick,
      style = W.Style.SingleGrain,
      abv = 43.0,
      tasting = Some W.Tasting::{
        rating = 83,
        confidence = W.Confidence.Normal,
        summary = "very simple but not unpleasant; unexpectedly bourbony (ex-bourbon cask does all the talking); a touch more detail than single-note but ordinary overall — remarkable value at R280/~€14",
        journal = Some "journal/2026-06-01-bains-cape-mountain.md"
      },
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (Bain's) + The Whiskey Wash",
            summary = Some "100% SA yellow maize, double-matured in first-fill ex-bourbon casks; approachable and well-balanced rather than complex",
            nose = Some "Grapefruit peel, custard cream, icing sugar, nutmeg, vanilla, toffee, banana, fresh pear",
            palate = Some "Vanilla cream, fresh pear, banana, cardamom, oak, coconut cream, bright lemon; light and clean",
            finish = Some "Sweet citrus peel, meadowsweet, warming spice, grapefruity bitterness; relatively short but pleasant"
          }
        ],
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Medium,
        price = { amount = 280, currency = W.Currency.Zar },
        market = W.Market.Sa,
        claudePick = True,
        why = "SA-trip buy — R280/~€14, exceptional price-to-quality. Tasted: ordinary but decent and totally inoffensive. At this price a no-brainer for a casual pour or guests."
      }
    }
