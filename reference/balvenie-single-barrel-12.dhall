let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "balvenie-single-barrel-12",
      name = "Balvenie 12 Single Barrel First Fill",
      producer = P.balvenie,
      style = W.Style.SingleMalt,
      abv = 47.8,
      age = Some 12,
      casks = [ "single first-fill ex-bourbon barrel" ],
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (Balvenie)",
            summary = Some "One hand-picked first-fill bourbon cask per bottling, ≤300 hand-numbered bottles — the naked, cask-strength-adjacent view of the Balvenie spirit",
            nose = Some "Honey notes overlaid with sweet fruits and subtle spices",
            palate = Some "Rich and complex with deep vanilla oakiness",
            finish = Some "Lingeringly sweet"
          }
        ]
    }
