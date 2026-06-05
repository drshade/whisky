let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "glenlivet-nadurra-oloroso",
      name = "Glenlivet Nàdurra Oloroso",
      producer = P.glenlivet,
      style = W.Style.SingleMalt,
      abv = 60.0,
      casks = [ "oloroso sherry" ],
      externalNotes =
        [ W.ExternalNotes::{
            source = "The Whisky Shop + The Whisky Study (85/100)",
            summary = Some "First-fill oloroso sherry casks, cask strength (batches ~48-60%); leans spiced and fruit-forward rather than dark heavy sherry; best with a little water; batch variation is real",
            nose = Some "Dry and spicy with sweet dried fruit: raisins, apricots, apple; rich nutty sherry, dark plums, orange, date syrup, sweet oak, sandalwood",
            palate = Some "Maple syrup, molasses, fig, walnut, plum; zesty orange marmalade, dark chocolate; strong black pepper; leather and building spice",
            finish = Some "Earthy and nutty; longer than expected; green apple and light malt (classic Glenlivet); warm, faintly feisty"
          }
        ],
      wishlist = Some W.Wishlist::{
        priority = W.Priority.Medium,
        price = { amount = 70, currency = W.Currency.Eur },
        market = W.Market.NlEu,
        claudePick = True,
        why = "The Glenlivet worth owning — cask-strength, sherried, NCF, great value. Skip the 12; this fits."
      }
    }
