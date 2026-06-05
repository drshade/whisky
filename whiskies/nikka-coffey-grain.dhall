let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "nikka-coffey-grain",
      name = "Nikka Coffey Grain",
      producer = P.nikka,
      style = W.Style.SingleGrain,
      abv = 45.0,
      externalNotes =
        [ W.ExternalNotes::{
            source = "Whisky Advocate + Selfbuilt (8.7/10 meta-critic)",
            summary = Some "Corn whisky in a genuine antique Coffey still, re-used casks for lightness — polished, creamy and sweet; closer to fine Canadian grain than Kentucky bourbon",
            nose = Some "Caramel, vanilla, sweet corn syrup, toffee fudge, ripe banana, peach, light hazelnut; melon, chamomile, floral thread",
            palate = Some "Soft creamy arrival with vanilla, caramel, light oak and pleasant spice; thick and sweet with raspberry and fruit salad notes; persistent lightly sweet creaminess",
            finish = Some "Short to medium and relatively thin; corn sweetness and vanilla carry through; caramel, faint oak, whisper of spice"
          }
        ],
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Entry,
        theme = W.Theme.JapaneseWhisky,
        findability = W.Findability.Amber,
        note = "Lush grain whisky — a natural step from your love of Hedonism."
      }
    }
