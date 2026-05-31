# Tasting Journal

One file per tasting sitting. To start a new entry:

1. Copy `_template.md` to `YYYY-MM-DD-distillery-expression.md`.
2. Fill in the frontmatter + notes (or ask Claude to write it up with you).
3. Set the bottle's `tasting` facet (rating, summary, `journal` link) in its
   `whiskies/<id>.dhall`, then run `make build`. The collection, ranking and
   tasting log regenerate automatically — never hand-edit those.

Entries are listed newest-first by filename date.
