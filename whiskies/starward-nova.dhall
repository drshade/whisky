let W = ../schema/Whisky.dhall

in  W.Whisky::{
      id = "starward-nova",
      name = "Starward Nova",
      classification = W.world
        { country = W.WorldCountry.Australia,
          producer = "Starward",
          style = "Single malt"
        },
      abv = 41.0,
      casks = [ "red wine" ],
      recommendation = Some W.Recommendation::{
        tier = W.Tier.Entry,
        styleGroup = "Other world whisky",
        findability = W.Findability.Amber,
        note = "Red-wine-cask matured; juicy, approachable."
      }
    }
