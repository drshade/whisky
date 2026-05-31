.PHONY: build verify repl

# Regenerate README.md, collection.md, wishlist.md, recommendations.md from whiskies/*.dhall
build:
	cabal run -v0 whisky-catalogue

# Type-check the data + code without writing files (decodes every whisky)
verify:
	cabal build

# Interactive query REPL over the typed [Whisky] — for ad-hoc questions
# ("favourites from Speyside?") without hand-reading the Dhall. Lands ready:
#   ws <- loadWhiskies "whiskies"
#   [ w.name | w <- ws, w.producer.origin == Speyside ]
# (Imports are fed on stdin so they run after the package loads; cat then
#  hands the terminal back to you.)
repl:
	@{ printf 'import Whisky.Load\nimport Whisky.Types\nimport Data.List\nimport Data.Ord\n'; cat; } | cabal repl whisky-catalogue
