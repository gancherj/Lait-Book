# The Lait Book

This textbook documents the Lait programming language. Lait is a
minimal language in the ML family designed for teaching. 
Lait is implemented as a DSL in Lean, enabling it to benefit from the Lean
ecosystem. 

The textbook is built using [mdbook](https://rust-lang.github.io/mdBook/),
along with a custom extension [leandown](https://github.com/mzhang28/leandown)
which enables Lean (and hence, Lait) code to display correctly with information
coming from the LSP. 

## Prerequisites

- `mdbook`
- `npm`, and a Lean toolchain (`lake`) on `PATH`.
- `npm install` — pulls `@leandown/mdbook` from the registry. It ships the preprocessor (`node_modules/.bin/mdbook-leandown`) along with the browser
  runtime and stylesheet in `dist/`, which `book.toml` references directly, so
  there is nothing to generate or copy.

## Building

```bash
npm install
(cd ../leansrc/ && lake build)  # imports resolve against build artifacts, so build first
npm run build               # == mdbook build
npm run serve               # same, with mdbook's live reload
```
