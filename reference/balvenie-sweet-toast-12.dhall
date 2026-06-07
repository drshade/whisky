let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "balvenie-sweet-toast-12",
      name = "Balvenie 12 Sweet Toast of American Oak",
      producer = P.balvenie,
      style = W.Style.SingleMalt,
      abv = 43.0,
      age = Some 12,
      casks = [ "ex-bourbon", "toasted virgin American oak finish" ],
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (Balvenie) + Flaviar",
            summary = Some "Stories range — Kelsey McKechnie's sweeter, fruit-forward inversion of the DoubleWood idea: ex-bourbon then finished in slow-toasted virgin Kentucky oak (Kelvin Cooperage)",
            nose = Some "Light and malty with distinct vanilla and gingerbread",
            palate = Some "Chocolate orange, coconut, citrus zest, brittle toffee, toasted oak",
            finish = Some "Rich, with vanilla spice"
          }
        ]
    }
