let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "sazerac-rye",
      name = "Sazerac Rye",
      producer = P.buffaloTrace,
      style = W.Style.Rye,
      abv = 45.0,
      externalNotes =
        [ W.ExternalNotes::{
            source = "Whisky Advocate (95 pts) + Breaking Bourbon",
            summary = Some "Buffalo Trace's ~51% rye mashbill, 45% — WA 95 pts, described as 'no rye on the market as perfectly balanced'; fruit-and-spice integrated; excellent for cocktails or neat",
            nose = Some "Clove, sweet vanilla, anise, pepper; orange zest, raisin, rye spice; peppermint, caramel, honey, rye bread, citrus, toasted grains",
            palate = Some "Bold spices softened by candied fruit, coconut, caramel, rum notes; sweet apricots, orange peel, plums, caramel, vanilla; clean and polished",
            finish = Some "Dry, flinty, spicy; mint, eucalyptus, cinnamon, vanilla, lingering pepper; medium length; black licorice, dark fruit, caramel"
          }
        ],
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Entry,
        theme = W.Theme.RyeWhiskey,
        findability = W.Findability.Amber,
        note = "Softer, sweeter 'New Orleans' rye; easy entry."
      }
    }
