let W = ../schema/Whisky.dhall

let P = ../producers.dhall

in  W.Whisky::{
      id = "laphroaig-10",
      name = "Laphroaig 10",
      producer = P.laphroaig,
      style = W.Style.SingleMalt,
      abv = 40.0,
      age = Some 10,
      casks = [ "peat" ],
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Entry,
        styleGroup = "Classic Islay",
        findability = W.Findability.Green,
        note = "Iodine, seaweed, TCP — love-it-or-hate-it Islay."
      }
    }
