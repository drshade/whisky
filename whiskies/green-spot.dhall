let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "green-spot",
      name = "Green Spot",
      producer = P.midleton,
      style = W.Style.SinglePotStill,
      abv = 40.0,
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Benchmark,
        theme = W.Theme.IrishPotStill,
        findability = W.Findability.Amber,
        note = "Lighter, orchard-fruit pot still; great everyday."
      },
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (Spot Whiskey / Mitchell & Son)",
            summary = Some "NAS single pot still (7-10yr), bourbon and sherry casks — the quintessential approachable Irish pot still; fresh, spiced, orchard-fruity",
            nose = Some "Fresh aromatic oils and spices; green apple, pear, soft vanilla, honeyed barley, hint of clove",
            palate = Some "Full, spicy body; green apples, cloves, rounded by toasted oak; creamy texture with cinnamon and brown sugar",
            finish = Some "Lingering spices and barley; warm vanilla, soft oak tannin, mild herbal trace"
          }
        ]
    }
