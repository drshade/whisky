.PHONY: build verify

# Regenerate README.md, collection.md, wishlist.md, recommendations.md from whiskies/*.dhall
build:
	cabal run -v0 whisky-catalogue

# Type-check the data + code without writing files (decodes every whisky)
verify:
	cabal build
