let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "rittenhouse-rye",
      name = "Rittenhouse Rye BiB",
      producer = P.heavenHill,
      style = W.Style.Rye,
      abv = 50.0,
      externalNotes =
        [ W.ExternalNotes::{
            source = "Whisky Advocate + Breaking Bourbon + World's Best American Whiskey 2010",
            summary = Some "Bottled-in-Bond, 100 proof, fruit-forward for a rye — more stone fruit than dill-and-anise Indiana style; World's Best American Whiskey 2010 WWA; excellent value at ~$25",
            nose = Some "Sweet licorice, dill, honey, dried banana, light peaches, malty grains; rye spice, caramel, vanilla, pipe tobacco; cedar, mint, nutmeg, dried orange peel",
            palate = Some "Bold rye spice with honey, brown sugar, cinnamon; peaches, dried banana, white pepper; herbal and sweet licorice, rye bread, apple, orange; medium body, balanced",
            finish = Some "Dry with lingering rye spice, oak tannins and black pepper; leather, lightly charred oak, light peach; honey, licorice, cocoa emerging after a minute"
          }
        ],
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Medium,
        price = { amount = 45, currency = W.Currency.Eur },
        market = W.Market.NlEu,
        claudePick = True,
        why = "Opens rye — spicy, drier counterpoint to my bourbons. Cheap style test."
      },
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Benchmark,
        theme = W.Theme.RyeWhiskey,
        findability = W.Findability.Amber,
        note = "The value benchmark — bold, baking-spice, brilliant in a cocktail or neat."
      }
    }
