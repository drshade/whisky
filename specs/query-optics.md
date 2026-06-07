# Spec: Optics query library + validation hardening

---
spec_type: feature
status: approved
created: 2026-06-07
updated: 2026-06-07
author: tom (with Claude)
---

## Purpose

Ad-hoc repl queries are the repo's read path, and two pain points recur:
flattening the `Maybe`-heavy `externalNotes` shape, and case-insensitive text
matching. A small optics-based vocabulary names the catalogue's data paths once
and composes, instead of accreting bespoke helper functions per question.
Separately, the build's validation gate has known holes (id/filename drift,
dangling journal links, duplicate ids) that a typed write-path cannot catch.

## Scope

**In scope**
- `Whisky.Query`: domain folds, case-insensitive matching, list-bridging query
  verbs, `loadAll` (both collections) — repl-first, zero impact on rendering.
- Field labels (`#name`, `#rating`, …) for all record types via `optics-th`.
- Build-blocking validation: `id` must equal filename stem; ids unique across
  `whiskies/` + `reference/`; `tasting.journal` paths must exist.
- A `make new` scaffold for new bottle files.
- Repl preamble: auto-import the query vocabulary.

**Out of scope**
- Programmatic *writes* to Dhall (editor + type-checker stays the write path).
- Optics use in the renderers (they stay record-dot).
- A test-suite stanza (revisit separately).

## Functional Requirements

- **Must**: Every existing repl query style (list comprehension, record-dot)
  keeps working unchanged.
- **Must**: `notes`/`nose`/`palate`/`finish` folds reach all external-note text
  without manual `Maybe` handling.
- **Must**: `(~~)` matches Text case-insensitively (infix substring).
- **Must**: Query verbs (`with`, `without`, `whose`, `pick`, `rankBy`) accept
  any fold-like optic.
- **Must**: A whisky file whose `id` differs from its filename stem fails the
  build, naming the file.
- **Must**: Duplicate ids across both collections fail the build.
- **Must**: A `tasting.journal` path that does not exist on disk fails the build.
- **Must**: `make new id=<id> producer=<key>` creates a well-formed bottle file
  that fails `make build` only on its placeholder content being absent — i.e.
  the scaffold itself decodes.
- **Must Not**: Generated markdown changes as a result of this feature.

## Non-Functional Requirements

- Only `optics-core` and `optics-th` are added as dependencies.
- `OverloadedLabels` is enabled per-module / in the repl, not project-wide.

## Acceptance Criteria

- Given the seeded catalogue, when the example queries in AGENTS.md run in the
  repl, then they return correct results.
- Given a file `whiskies/x.dhall` with `id = "y"`, when `make build` runs, then
  the build fails naming `whiskies/x.dhall`.
- Given the same id in `whiskies/` and `reference/`, when `make build` runs,
  then the build fails naming both files.
- Given a `tasting.journal` pointing at a missing file, when `make build` runs,
  then the build fails naming the bottle.
- Given a clean checkout, when `make build` runs, then generated views are
  byte-identical to before this feature.

## Open Questions

- [ ] None.
