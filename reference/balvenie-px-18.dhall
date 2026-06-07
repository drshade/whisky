let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "balvenie-px-18",
      name = "Balvenie 18 Pedro Ximénez Cask",
      producer = P.balvenie,
      style = W.Style.SingleMalt,
      abv = 48.7,
      age = Some 18,
      casks = [ "american oak", "PX sherry finish" ],
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (Balvenie)",
            summary = Some "Travel-retail exclusive — 18yr finished in Pedro Ximénez sherry casks; the dark-fruit, high-proof end of the cask-finish range",
            nose = Some "Raisins and bursting currants intertwined with oak and subtle clove, concealing smooth sweet lavender",
            palate = Some "Tart grape skin, mandarin and fig flowing with vibrant oak; delicate oil and honeyed sweetness coating the mouth",
            finish = Some "Long-lasting and complex"
          }
        ]
    }
