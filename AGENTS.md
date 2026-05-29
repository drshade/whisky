# Repo Guide & Agent Instructions

## What this repo is

A personal, git-backed **whisky catalogue** kept entirely in plain markdown. It tracks the
collection, a wishlist, a dated tasting journal, an evolving taste profile, and curated
buying recommendations. The owner uses Claude as a curator — to log tastings, suggest
additions, and keep the catalogue coherent.

The owner is currently in **discovery mode**: actively exploring breadth across regions and
styles rather than narrowing down. See `preferences.md` for the established taste profile
(it's the source of truth — don't duplicate it elsewhere).

## File layout

| File / folder                | Purpose                                                       |
|------------------------------|---------------------------------------------------------------|
| `README.md`                  | **Live dashboard** — at-a-glance collection summary & ranking |
| `collection.md`              | Full collection table (source of truth for what's owned)      |
| `wishlist.md`                | Whiskies to try/buy — priority + reasons                      |
| `recommendations.md`         | Curated picks by region/style not yet covered                 |
| `preferences.md`             | Evolving taste profile + 0–100 rating scale                   |
| `tasting-room-cheatsheet.md` | Phone-friendly crib for the NPF Tasting Room bar              |
| `journal/`                   | Dated tasting notes, one file per sitting                     |
| `journal/_template.md`       | Copy this to start a new entry                                |

## Conventions

- **Status:** `sealed` · `open` · `finished`.
- **Rating:** personal 0–100 (scale defined in `preferences.md`). `*` suffix = low-confidence,
  needs more tastings.
- **Region:** distillery region/country (Islay, Speyside, Highland, Kentucky, Japan, …).
- **Journal filenames:** `journal/YYYY-MM-DD-distillery-expression.md`.
- **Sampled drams:** the journal can include whiskies tasted out (bars, dinners) that
  aren't owned — mark them `owned: no` in frontmatter + a `sampled` tag, and do **not**
  add them to `collection.md` or the README ranking.
- **Home market:** Netherlands / EU (euro earner) — broad availability; default buying
  market. Occasional SA trips (shops: Norman Goodfellows, NPF Tasting Room, Melrose Arch)
  for *local* SA whisky + genuine bargains; mind SA import duties on imported bottles.
- **Currency:** € at home, R on SA trips. Budget ≈ €50–100 / R1000–2000 per bottle.

## Workflows (for Claude)

**Logging a tasting**
1. Copy `journal/_template.md` → `journal/YYYY-MM-DD-<distillery>-<expression>.md`.
2. Record **only what the owner actually reports.** Don't invent nose/palate/finish notes;
   leave prompts for unstated sections. General style facts are fine but mark them as such.
3. Update the bottle's **Rating** and **Journal** link in `collection.md`.
4. **Update `README.md`** — keep its summary stats and ranking table in sync.

**Adding / moving bottles**
- New bottle → add to `collection.md` (and update README). When a wishlist bottle is bought,
  move it from `wishlist.md` to `collection.md`.
- Keep the README summary counts (`owned` / `open` / `sealed`, by-style, by-region) correct.

**Curating & recommending**
- Respect the **taste profile** in `preferences.md`, the **R1000–2000 budget**, and the
  **discovery-mode** preference for variety/new ground.
- `preferences.md` is a *working draft* — update it as new patterns emerge across the
  journal, but preserve the owner's "stage / discovery mode" framing unless they change it.

## Ground rules

- **Be honest and critical** — never inflate a whisky or pander. Bad ideas get flagged.
- **Don't fabricate facts.** Verify bottle details (ABV, casks, distillery) via web search
  rather than guessing; flag anything uncertain.
- **Keep scope tight** — only change what the task needs.
- **Commit when asked**, with concise messages.
