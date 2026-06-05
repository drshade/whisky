let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "nikka-from-the-barrel",
      name = "Nikka From The Barrel",
      producer = P.nikka,
      style = W.Style.Blend,
      abv = 51.4,
      externalNotes =
        [ W.ExternalNotes::{
            source = "Whisky Advocate (94 pts, Whisky of the Year 2018) + Words of Whisky (2024)",
            summary = Some "100+ malt and grain components bottled with minimal dilution — WA Whisky of the Year 2018; ridiculous value; intense, oily and layered",
            nose = Some "Rich oaky aromas, vanilla, chocolate sweetness, gorgeous orange peel; butterscotch, poached pears, stone fruit, coffee, old oak, tobacco, allspice, cloves, ginger",
            palate = Some "Thick and sweet; oak astringency, firm and full-bodied; caramel, toffee, lemon citrus; oily; coffee, resin, oak spices, ginger, gentle smoke, jammy fruits",
            finish = Some "Woody and bitter; medium length with sweet caramel and lighter spices (nutmeg) fading to persistent oaky bitterness; hint of burnt toast"
          }
        ],
      wishlist = Some W.Wishlist::{
        priority = W.Priority.High,
        price = { amount = 55, currency = W.Currency.Eur },
        market = W.Market.NlEu,
        claudePick = True,
        why = "Opens Japan — intense, spicy, layered at 51.4%. Strength that earns its complexity."
      },
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Benchmark,
        theme = W.Theme.JapaneseWhisky,
        findability = W.Findability.Amber,
        note = "Ridiculous value; intense, spicy, full. The one to start on."
      }
    }
