.PHONY: build verify repl new

# Regenerate README.md, collection.md, wishlist.md, recommendations.md from whiskies/*.dhall
build:
	cabal run -v0 whisky-catalogue

# Type-check the data + code without writing files (decodes every whisky)
verify:
	cabal build

# Interactive query REPL over the typed [Whisky] — for ad-hoc questions
# ("favourites from Speyside?") without hand-reading the Dhall. Lands ready
# with the Whisky.Query optics vocabulary in scope:
#   ws <- loadAll                                  -- whiskies/ + reference/
#   ws & whose notes (=~ "honey") & pick #name
#   ws & whose origin (== Speyside) & rankBy rating & pick #name
# Plain styles still work: ws <- loadWhiskies "whiskies"; [ w.name | w <- ws, … ]
# (Imports are fed on stdin so they run after the package loads; cat then
#  hands the terminal back to you.)
repl:
	@{ printf ':seti -XOverloadedLabels\n:m\nimport Prelude hiding ((%%))\nimport Whisky.Load\nimport Whisky.Types\nimport Whisky.Query\nimport Optics.Core hiding (without)\nimport Data.List\nimport Data.Ord\nimport qualified Data.Text as T\n'; cat; } | cabal repl whisky-catalogue

# Scaffold a new bottle file: make new id=<id> producer=<key-in-Producers.dhall> [to=whiskies|reference]
# Fill in name/style/abv (and facets) afterwards, then `make build`.
new:
	@test -n "$(id)" || { echo 'usage: make new id=<id> producer=<key> [to=whiskies|reference]'; exit 1; }
	@test -n "$(producer)" || { echo 'usage: make new id=<id> producer=<key> [to=whiskies|reference]'; exit 1; }
	@test ! -e "$(or $(to),whiskies)/$(id).dhall" || { echo "$(or $(to),whiskies)/$(id).dhall already exists"; exit 1; }
	@printf 'let W = ../schema/Whisky.dhall\n\nlet P = ../schema/Producers.dhall\n\nin  W.Whisky::{\n      id = "%s",\n      name = "CHANGEME",\n      producer = P.%s,\n      style = W.Style.SingleMalt,\n      abv = 40.0\n    }\n' '$(id)' '$(producer)' > "$(or $(to),whiskies)/$(id).dhall"
	@echo "created $(or $(to),whiskies)/$(id).dhall — fill in name/style/abv, then make build"
