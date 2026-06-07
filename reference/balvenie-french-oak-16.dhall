let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "balvenie-french-oak-16",
      name = "Balvenie 16 French Oak (Pineau Cask)",
      producer = P.balvenie,
      style = W.Style.SingleMalt,
      abv = 47.6,
      age = Some 16,
      casks = [ "american oak", "Pineau des Charentes French oak finish" ],
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (Balvenie)",
            summary = Some "Finished in French oak that held Pineau des Charentes; non-chill-filtered — an atypically zesty, floral Balvenie",
            nose = Some "Light floral notes of lotus and geranium between fresh meadow grass and peeled apple skin",
            palate = Some "Energising zing of tangy lemon rind and grapefruit meeting subtle sweetness of glazed fruits and root-ginger spice",
            finish = Some "Refreshingly concise; tangy citrus with glazed-fruit sweetness"
          }
        ]
    }
