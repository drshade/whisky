let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "balvenie-madeira-15",
      name = "Balvenie 15 Madeira Cask",
      producer = P.balvenie,
      style = W.Style.SingleMalt,
      abv = 43.0,
      age = Some 15,
      casks = [ "american oak", "madeira finish" ],
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (Balvenie) + Whisky Gospel",
            summary = Some "Travel-retail exclusive — 15yr American oak then Madeira cask finish; the house honey/vanilla with fresh peaches, orange zest, hazelnut and toffee",
            nose = Some "Nutty and soft; baked fruits — pears, peaches, apricots — white pepper, cinnamon, floral honey, white and milk chocolate",
            palate = Some "Stone fruits and peels, orange peel, nuttiness, cinnamon and white pepper, oak spices, ginger, gentle bitterness",
            finish = Some "Medium-long, slightly spicy, dusty and nutty"
          }
        ]
    }
