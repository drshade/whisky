let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "west-cork-10-maritime-sherry",
      name = "West Cork Maritime Release 10 Sherry Cask",
      producer = P.westCork,
      style = W.Style.SingleMalt,
      abv = 43.0,
      age = Some 10,
      casks = [ "first-fill ex-bourbon", "sherry finish" ],
      ownership = Some W.Ownership::{
        status = W.Status.Open,
        boughtWhere = Some "Gift"
      },
      externalNotes =
        [ W.ExternalNotes::{
            source = "Retailer/auction listings only — official site offline at time of entry (2026-08); no critic or Whiskybase score exists for this bottling",
            summary = Some "Travel-retail exclusive at 43% (the standard West Cork 10 single malt is 40% bourbon-cask, a different bottle). First-fill bourbon matured then finished in sherry casks; sherry type, filtration and colouring all undocumented. Marsh Road distillery only opened 2020, so aged West Cork malt is widely attributed to sourced Cooley distillate matured and finished by West Cork. Bottle is a maritime glass-float shape — the founders were Skibbereen trawlermen"
          }
        ]
    }
