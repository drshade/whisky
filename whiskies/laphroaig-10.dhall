let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "laphroaig-10",
      name = "Laphroaig 10",
      producer = P.laphroaig,
      style = W.Style.SingleMalt,
      abv = 40.0,
      age = Some 10,
      casks = [ "peat" ],
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (Laphroaig) + The Whiskey Wash",
            summary = Some "Most aggressively medicinal/iodine-forward major Islay malt with a sweetness that rewards patience — polarising, potent and iconic",
            nose = Some "Peat smoke, seaweed, prominent medicinal iodine (TCP, antiseptic bandages); sweet vanilla, coconut, dried banana, white chocolate, hazelnut, farmyard funk",
            palate = Some "Surprising sweetness — banana, caramelised vanilla — then smoke develops; smoked ham, maritime salt, smoked dark chocolate",
            finish = Some "Long and lingering; smoked tea, burnt herbs, Cajun spice, jalapeño notes; iodine tingle then sweet seaweed afterglow"
          }
        ],
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Entry,
        theme = W.Theme.ClassicIslay,
        findability = W.Findability.Green,
        note = "Iodine, seaweed, TCP — love-it-or-hate-it Islay."
      }
    }
