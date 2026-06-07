let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "balvenie-portwood-21",
      name = "Balvenie 21 PortWood",
      producer = P.balvenie,
      style = W.Style.SingleMalt,
      abv = 40.0,
      age = Some 21,
      casks = [ "port pipe finish" ],
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (Balvenie) + Master of Malt",
            summary = Some "Marriage of rare Balvenies finished in 30-year-old port pipes — the classic prestige bottling (40% in EU; 47.6% NCF in travel retail)",
            nose = Some "Fruity, ripe raisin backed by nutty dryness; white peach, honey, sultana, macadamia, subtle balsamic",
            palate = Some "Refined and creamy; cranberries, cooked raspberries, white grape and barley, with cocoa as it tails away"
          }
        ]
    }
