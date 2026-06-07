let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "balvenie-25-rare-marriages",
      name = "Balvenie 25 (Rare Marriages)",
      producer = P.balvenie,
      style = W.Style.SingleMalt,
      abv = 48.0,
      age = Some 25,
      casks = [ "ex-bourbon american oak", "ex-oloroso european oak puncheons" ],
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (Balvenie)",
            summary = Some "Rare Marriages range — mostly ex-bourbon married with a smaller share of ex-oloroso puncheons; NCF, natural colour",
            nose = Some "Soft autumn fruits, runny honey, crystallised ginger and raw cane sugar over rich oakiness",
            palate = Some "Bold vanilla oak dissipating into toasted marshmallow, fresh fruit terrine and cinnamon-infused apple tart",
            finish = Some "Very long; lingering honey and spice"
          }
        ]
    }
