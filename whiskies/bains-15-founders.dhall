let W = ../schema/Whisky.dhall

let P = ../schema/Producers.dhall

in  W.Whisky::{
      id = "bains-15-founders",
      name = "Bain's Cape Mountain 15yr Founders Collection",
      producer = P.jamesSedgwick,
      style = W.Style.SingleGrain,
      abv = 52.5,
      age = Some 15,
      ownership = Some W.Ownership::{
        status = W.Status.Sealed,
        paid = Some "R1255",
        boughtWhere = Some "OR Tambo duty free",
        boughtWhen = Some "2026-06-07"
      },
      externalNotes =
        [ W.ExternalNotes::{
            source = "Official (Bain's Founders Collection) + The Whiskyphiles",
            summary = Some "Limited release of 3,600 bottles; duty-free exclusive at Cape Town/OR Tambo airports and James Sedgwick Distillery; 52.5% single grain, 15 years in American oak",
            nose = Some "Soft floral notes, tropical fruits, banana, teak, rich vanilla, toasted nuts, muscovado sugar, wood, black pepper",
            palate = Some "Sweet butterscotch, raisins, banana loaf, vanilla sugar, cinnamon, pepper, caramelised banana, toasted wood, dried fruit, marmalade; creamy and complex",
            finish = Some "Warm and spicy with smooth, silky mouthfeel; long"
          }
        ]
    }
