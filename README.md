# 🥃 Whisky Catalogue

A git-backed catalogue of my whisky collection, wishlist, and tasting journal.
Everything lives in plain markdown so it's readable, hand-editable, and easy for
Claude to curate alongside me.

## Layout

| File / folder      | What it holds                                              |
|--------------------|------------------------------------------------------------|
| `collection.md`    | What I currently own — at-a-glance table                   |
| `wishlist.md`      | Whiskies I'd like to try or buy, with priority + reasons   |
| `recommendations.md` | Claude's curated picks by region/style I've not covered  |
| `tasting-room-cheatsheet.md` | Phone-friendly crib for the NPF Tasting Room bar      |
| `preferences.md`   | My evolving taste profile (what I like, dislike, chase)    |
| `journal/`         | Dated tasting notes & reviews, one file per sitting        |
| `journal/_template.md` | Copy this to start a new tasting entry                  |

## How to use it

- **Add a bottle** — add a row to `collection.md` (or ask Claude to).
- **Log a tasting** — copy `journal/_template.md` to `journal/YYYY-MM-DD-bottle.md`
  and fill it in. Update the bottle's `Rating` and `Journal` link in `collection.md`.
- **Curate** — ask Claude things like:
  - "Based on my collection and preferences, suggest 3 bottles for my wishlist."
  - "I just tasted the Lagavulin 16 — help me write up the notes."
  - "What gap is there in my collection?"
- **Keep preferences fresh** — after a few tastings, ask Claude to update
  `preferences.md` from the journal.

## Conventions

- **Status**: `sealed`, `open`, or `finished`.
- **Rating**: personal 0–100 scale (see `preferences.md` for the scale).
- **Region**: distillery region/country (Islay, Speyside, Highland, Ireland,
  Kentucky, Japan, …).
- Journal filenames: `YYYY-MM-DD-distillery-expression.md`.
