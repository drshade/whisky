let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "michters-rye",
      name = "Michter's US*1 Single Barrel Rye",
      producer = P.michters,
      style = W.Style.Rye,
      abv = 42.4,
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (Michter's) + Master of Malt",
            summary = Some "Single barrel Kentucky straight rye, 42.4% — approachable, lower-proof; leans sweeter and fruitier than the style's reputation; the go-to introductory rye at the price",
            nose = Some "Spice and peppery notes, citrus, butterscotch, oak; Werther's Original, dry wood, spicy rye, blackcurrant, pear, cherry, vanilla, cedar",
            palate = Some "Dried orange peel, stem ginger, brown sugar, cherry, hickory, buttered corn; caramel, green apple, baking spice; creamy with citrus and rye spice",
            finish = Some "New leather, caramel, cinnamon, peppercorn, apple; begins dry then gingerbread, oak and leather take over; soft pepper lingers"
          }
        ],
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Entry,
        theme = W.Theme.RyeWhiskey,
        findability = W.Findability.Green,
        note = "Refined, rounded, very approachable."
      }
    }
