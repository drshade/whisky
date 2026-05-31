--| The producer registry — every distillery / blender / bottler defined ONCE,
--  with its kind and origin. Whiskies reference these (`P.oban`, …); origin is
--  never restated per bottle. Add a producer here and point a whisky at it.

let W = ./schema/Whisky.dhall

let K = W.ProducerKind

let O = W.Origin

let p =
      \(name : Text) ->
      \(kind : W.ProducerKind) ->
      \(origin : W.Origin) ->
        { name = name, kind = kind, origin = origin } : W.Producer

in  { -- Scotch distilleries
      oban = p "Oban" K.Distillery O.Highland
    , dalwhinnie = p "Dalwhinnie" K.Distillery O.Highland
    , glenmorangie = p "Glenmorangie" K.Distillery O.Highland
    , kilchoman = p "Kilchoman" K.Distillery O.Islay
    , ardbeg = p "Ardbeg" K.Distillery O.Islay
    , macallan = p "Macallan" K.Distillery O.Speyside
    , aberlour = p "Aberlour" K.Distillery O.Speyside
    , glendronach = p "GlenDronach" K.Distillery O.Highland
    , glenfarclas = p "Glenfarclas" K.Distillery O.Speyside
    , glenlivet = p "Glenlivet" K.Distillery O.Speyside
    , balvenie = p "Balvenie" K.Distillery O.Speyside
    , springbank = p "Springbank" K.Distillery O.Campbeltown
    , glengyle = p "Glengyle" K.Distillery O.Campbeltown
    , highlandPark = p "Highland Park" K.Distillery O.Islands
    , glenScotia = p "Glen Scotia" K.Distillery O.Campbeltown
    , glenGrant = p "Glen Grant" K.Distillery O.Speyside
    , laphroaig = p "Laphroaig" K.Distillery O.Islay
    , lagavulin = p "Lagavulin" K.Distillery O.Islay
    , glenfiddich = p "Glenfiddich" K.Distillery O.Speyside
    , bruichladdich = p "Bruichladdich" K.Distillery O.Islay
      -- Scotch blenders
    , compassBox = p "Compass Box" K.Blender O.ScotlandBlend
      -- American
    , buffaloTrace = p "Buffalo Trace" K.Distillery O.Kentucky
    , woodfordReserve = p "Woodford Reserve" K.Distillery O.Kentucky
    , widowJane = p "Widow Jane" K.Bottler O.USA
    , wildTurkey = p "Wild Turkey" K.Distillery O.Kentucky
    , heavenHill = p "Heaven Hill" K.Distillery O.Kentucky
    , makersMark = p "Maker's Mark" K.Distillery O.Kentucky
    , michters = p "Michter's" K.Bottler O.Kentucky
    , whistlePig = p "WhistlePig" K.Bottler O.USA
      -- Irish
    , midleton = p "Midleton" K.Distillery O.Ireland
      -- Japanese
    , nikka = p "Nikka" K.Distillery O.Japan
    , suntory = p "Suntory" K.Distillery O.Japan
      -- World
    , jamesSedgwick = p "James Sedgwick" K.Distillery O.SouthAfrica
    , amrut = p "Amrut" K.Distillery O.India
    , kavalan = p "Kavalan" K.Distillery O.Taiwan
    , starward = p "Starward" K.Distillery O.Australia
    }
