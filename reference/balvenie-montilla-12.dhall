let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "balvenie-montilla-12",
      name = "Balvenie 12 Montilla Cask",
      producer = P.balvenie,
      style = W.Style.SingleMalt,
      abv = 47.3,
      age = Some 12,
      casks = [ "European oak butts seasoned with Montilla wine" ],
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (Balvenie)",
            summary = Some "Collection of Curious Casks — full maturation in European oak seasoned with sweet Montilla wine from southern Spain; sherry-adjacent at a higher proof",
            nose = Some "Delicate, fresh and refined; vibrant barley sugar developing into flowing honey, balanced by toasted oak",
            palate = Some "Candied sweetness develops into rich vanilla oak, warming spice and dried apricots",
            finish = Some "Long and harmonious; lingering dried fruit, wine, honey and gentle spice"
          }
        ]
    }
