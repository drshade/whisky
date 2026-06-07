# Repo Guide & Agent Instructions

## What this repo is

A personal, git-backed **whisky catalogue**. The source of truth is **typed Dhall data** —
one file per whisky in `whiskies/*.dhall`, governed by `schema/Whisky.dhall`. A small Haskell
tool (`whisky-catalogue`) decodes them and **generates** the markdown views (`README.md`,
`docs/collection.md`, `docs/wishlist.md`, `docs/recommendations.md`). It tracks the collection, a wishlist, a
dated tasting journal, an evolving taste profile, and curated buying recommendations. The owner
uses Claude as a curator — to log tastings, suggest additions, and keep the catalogue coherent.

> **Generated files — never hand-edit:** `README.md`, `docs/collection.md`, `docs/wishlist.md`,
> `docs/recommendations.md`. Edit the Dhall data and either run `make build`
> (= `cabal run whisky-catalogue`) locally, or just push — the `build` GitHub Action
> regenerates them and commits the result. Hand edits will be overwritten.

The owner is currently in **discovery mode**: actively exploring breadth across regions and
styles rather than narrowing down. See `notes/preferences.md` for the established taste profile
(it's the source of truth — don't duplicate it elsewhere).

## File layout

| File / folder            | Purpose                                                              |
|--------------------------|---------------------------------------------------------------------|
| `whiskies/*.dhall`       | **Source of truth** — one typed record per whisky                   |
| `reference/*.dhall`      | Facts-only cache of bottles merely *known about* — no facets, no views |
| `schema/Producers.dhall` | Producer registry — each distillery/blender defined once, referenced |
| `schema/Whisky.dhall`    | The data model (producer, style, facets)                            |
| `src/`, `app/`, `*.cabal`| The `whisky-catalogue` Haskell generator                            |
| `README.md`              | _generated_ — at-a-glance dashboard, ranking, tasting log           |
| `docs/collection.md`          | _generated_ — full collection table (owned bottles)                 |
| `docs/wishlist.md`            | _generated_ — buy targets + try-first, by priority                  |
| `docs/recommendations.md`     | _generated_ — curated picks by region/style                         |
| `notes/preferences.md`         | Evolving taste profile + 0–100 rating scale (hand-written)          |
| `notes/goals.md`               | Living checklist — short / mid / long-term goals (hand-written)     |
| `journal/`               | Dated tasting notes, one file per sitting (prose; linked from data) |
| `journal/_template.md`   | Copy this to start a new entry                                      |

## Conventions

- **Status:** `sealed` · `open` · `finished`.
- **Rating:** personal 0–100 (scale defined in `notes/preferences.md`). `*` suffix = low-confidence,
  needs more tastings.
- **Region:** distillery region/country (Islay, Speyside, Highland, Kentucky, Japan, …).
- **Journal filenames:** `journal/YYYY-MM-DD-distillery-expression.md`.
- **Sampled drams:** a whisky tasted out (bar, dinner) but not owned is just a
  `whiskies/<id>.dhall` with a `tasting` facet and **no** `ownership` facet. It shows up in
  the README tasting log automatically and is excluded from the collection/ranking — no manual
  step needed.
- **Home market:** Netherlands / EU (euro earner) — broad availability; default buying
  market. Occasional SA trips (shops: Norman Goodfellows, NPF Tasting Room, Melrose Arch)
  for *local* SA whisky + genuine bargains; mind SA import duties on imported bottles.
- **Currency:** € at home, R on SA trips. Budget ≈ €50–100 / R1000–2000 per bottle.

## Workflows (for Claude)

All catalogue edits go through the Dhall data, then `make build`. Never hand-edit the
generated markdown.

**Logging a tasting**
1. Copy `journal/_template.md` → `journal/YYYY-MM-DD-<distillery>-<expression>.md`. Record
   **only what the owner actually reports** — don't invent nose/palate/finish notes.
2. In the bottle's `whiskies/<id>.dhall`, set the `tasting` facet (`rating`, `confidence`,
   `summary`, `journal` link). Use `confidence = Low` for tentative scores.
3. Run `make build`. Stats, ranking and the tasting log all update automatically — the tasting
   log includes sampled drams (no `ownership` facet); sealed bottles stay out until tasted.

**Adding / moving bottles**
- New bottle → `make new id=<id> producer=<key>` scaffolds `whiskies/<id>.dhall`
  (`to=reference` for the reference cache); fill in name/style/abv. Point `producer` at an
  entry in `schema/Producers.dhall`. Region/origin comes from the producer — never restate
  it on the bottle.
- The build **fails** on structural errors: `id` ≠ filename stem, duplicate ids across
  `whiskies/` + `reference/`, facets on reference entries, or `tasting.journal` paths that
  don't exist on disk.
- A producer not yet in the registry → add it to `schema/Producers.dhall` (name + kind + origin). Only a
  genuinely new **origin** needs a constructor in the `Origin` enum in `schema/Whisky.dhall`
  **and** its Haskell mirror in `src/Whisky/Types.hs`. `make build` runs a validation pass that
  flags implausible producer/style/origin combinations (e.g. a blender bottling a single malt).
- Owned vs sampled vs wanted is just which facets are present: `ownership` (own it),
  `tasting` (tried it), `wishlist` (want it — set `tryFirst = True` for taste-before-buying),
  `recommendation` (on the style map). A bottle can carry several at once.
- When a wishlist bottle is bought, add its `ownership` facet (leave/keep the others).
- Then `make build`.

**Answering ad-hoc questions ("my favourite Speyside?")**
- Don't hand-read the Dhall files. Run `make repl` for a ghci with the catalogue loaded
  and the `Whisky.Query` optics vocabulary in scope. `ws <- loadAll` gets both collections
  (`loadWhiskies "whiskies"` for just the catalogue), then:
  - `ws & whose notes (=~ "honey") & pick #name` — `=~` is case-insensitive contains;
    `notes`/`nose`/`palate`/`finish` reach all external-note text, Maybes pre-flattened.
  - `ws & whose origin (== Speyside) & rankBy rating & pick #name` — verbs: `with`,
    `without`, `whose`, `pick`, `rankBy`; facet folds: `_tasting`, `_ownership`,
    `_wishlist`, `_recommendation`; labels (`#name`, `_wishlist % #priority`) reach any field.
- Plain styles remain first-class — mix freely:
  `[ (w.name, t.rating) | w <- ws, w.producer.origin == Speyside, Just t <- [w.tasting] ]`.
- **Which loader:** `loadAll` for discovery/notes questions ("what mentions figs?"),
  `loadWhiskies "whiskies"` when the question is about the owner's collection,
  `loadWhiskies "reference"` for the cache alone. Facet-based queries (`with _wishlist`,
  `whose rating …`) can't match reference entries, so `loadAll` is always safe for those.
- More examples:
  - `ws & pick (nose % like "fig")` — the matching note fragments themselves.
  - `ws & without _ownership & whose nose (=~ "peat") & pick #name` — peated bottles
    I don't own (sampled drams, wishlist, reference) — cross-collection in one query.
  - `ws & with _wishlist & whose (_wishlist % #priority) (== PrHigh) & pick #name`.
  - Gotcha: `filteredBy` needs an *affine* argument — use `whose nose (=~ "peat")`,
    not `filteredBy (nose % like "peat")`.
- Field shapes live in `src/Whisky/Types.hs`; the vocabulary in `src/Whisky/Query.hs`.
  For a one-off, pipe the query in: `printf '<query>\n' | make repl` (mind that
  printf eats `%` — use a heredoc for queries containing optics composition).

**The reference cache (`reference/`)**
- A second collection, same `Whisky` schema: bottles the owner merely *knows about* —
  typically a producer's wider range surveyed during a recommendation conversation. Purpose:
  cache durable, verified facts (name, age, ABV, casks, external tasting notes) so they
  aren't re-searched every time.
- **Rules:** no facets (build fails — a facet means a relationship, so the file belongs in
  `whiskies/`); at least one sourced `externalNotes` record (build fails without);
  **never** prices, availability or retailers — those rot; git history dates each entry.
- **Promote** when a reference bottle becomes interesting: `git mv reference/<id>.dhall
  whiskies/<id>.dhall`, add the facet, `make build`.
- Reference entries appear in no generated view or stat. Query them in the repl:
  `rs <- loadWhiskies "reference"`.
- Don't bulk-import ranges speculatively — only cache what comes up in actual conversations.

**Adding reference / external tasting notes**
- Every whisky can carry `externalNotes` — a list of `W.ExternalNotes::{ source, summary, nose, palate, finish }` records from official distillery pages, critics (Whisky Advocate, Jim Murray, etc.) or other reputable sources. All fields except `source` are optional.
- Populate these via web search when adding a new bottle or when explicitly asked to backfill. Do not invent or paraphrase from memory — only record verified external content.
- The field is rendered in the README tasting log as a "Reference notes" column, so personal and external notes can be compared side-by-side.

**Curating & recommending**
- **Always record the source of a recommendation** in the `why` field of the `wishlist` or
  `recommendation` facet — e.g. "Darren's rec." or "Claude pick." If the owner doesn't say
  where it came from, ask before writing it up.
- Respect the **taste profile** in `notes/preferences.md`, the **R1000–2000 budget**, and the
  **discovery-mode** preference for variety/new ground.
- `notes/preferences.md` is a *working draft* — update it as new patterns emerge across the
  journal, but preserve the owner's "stage / discovery mode" framing unless they change it.
- **Never narrow or filter to the profile.** Keep recommending across the full spectrum,
  including styles/regions/brands the owner has disliked or rated low before — they
  explicitly want open horizons and expect their tastes to evolve. The profile adds context
  ("fits you now" / "a stretch"); it must never be used to exclude an option.

## Using Claude Code on the web

The cloud sandbox has no Haskell toolchain and blocks the Haskell download hosts by
default, so the generator can't build until the environment is configured (one-time, in
the claude.ai/code environment-settings dialog — not a repo file):

1. **Network access → Custom**, keep *"include default package managers"* ticked, add
   `*.haskell.org` (covers `get-ghcup.haskell.org` + `downloads.haskell.org`; Hackage is
   already in the defaults).
2. **Setup script** → paste [`scripts/cloud-setup.sh`](scripts/cloud-setup.sh) verbatim. The
   field's runner mangles long lines and the `|` character, so the script is kept pipe-free
   and short-lined. **Do not** use a `curl … | bash` one-liner — its long URL wraps and the
   orphaned `| bash` throws `syntax error near unexpected token '|'`.

The setup script is cached, so GHC only installs on the first session. Editing
`scripts/cloud-setup.sh` won't re-trigger the cache on its own — re-save the environment
(or wait for the ~7-day expiry) to pick up changes. The first `cabal build` per session is
still slow (deps aren't in the snapshot), then fast.

## Ground rules

- **Be honest and critical** — never inflate a whisky or pander. Bad ideas get flagged.
- **Don't fabricate facts.** Verify bottle details (ABV, casks, distillery) via web search
  rather than guessing; flag anything uncertain.
- **Keep scope tight** — only change what the task needs.
- **Commit when asked**, with concise messages.
