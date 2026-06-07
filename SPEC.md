# Spec: Reference collection (`reference/`)

---
spec_type: feature
status: approved
created: 2026-06-07
updated: 2026-06-07
author: tom (with Claude)
---

## Purpose

Recommendation conversations repeatedly re-search the same durable whisky facts
(expression names, age, ABV, cask regime, external tasting notes). A typed,
queryable reference cache of bottles the owner merely *knows about* — distinct
from bottles he has a relationship with — removes that repeated work without
polluting the personal catalogue.

## Scope

**In scope**
- A `reference/` directory of facet-less whisky records using the existing schema.
- Generator support: load + validate reference entries; keep them out of all
  personal views (stats, collection, ranking, wishlist, recommendations, tasting log).
- Repl access to reference data for ad-hoc queries.
- AGENTS.md documentation of the new collection and its conventions.
- Initial seed: the currently-purchasable Balvenie range (NL/EU).

**Out of scope**
- Prices, availability, retailers in reference entries (rots too fast).
- A generated `docs/reference.md` view (revisit if browsing demand appears).
- Bulk-importing ranges of brands not under active discussion.

## Functional Requirements

- **Must**: A reference entry is a `Whisky` record with no ownership, tasting,
  wishlist, or recommendation facet.
- **Must**: The generator loads `reference/*.dhall` and runs the same
  producer/style/origin validation as for `whiskies/*.dhall`.
- **Must**: Reference entries appear in no generated markdown view and no
  dashboard statistic.
- **Must**: The build fails if a reference entry carries any facet (promotion
  must be explicit: move the file to `whiskies/` and add the facet).
- **Must**: Reference entries carry at least one `externalNotes` record with a
  named source; content is verified, never invented.
- **Should**: Reference entries remain promotable by `git mv` alone — same
  schema, no transformation.
- **Must Not**: Reference entries record price, availability, or retailer.

## Non-Functional Requirements

- `make repl` must expose reference data with the same typed interface as the
  main catalogue.

## Acceptance Criteria

- Given a record in `reference/`, when `make build` runs, then generated views
  and stats are byte-identical to a build without it.
- Given a reference entry with a facet, when `make build` runs, then the build
  fails with a message naming the file.
- Given an invalid producer/style combination in `reference/`, when `make build`
  runs, then validation flags it as it would in `whiskies/`.
- Given `make repl`, when reference entries are loaded, then they can be queried
  as typed `[Whisky]`.

## Open Questions

- [ ] None.
