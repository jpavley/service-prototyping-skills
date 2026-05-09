# Project Conventions

Behavioral rules for working in this repo. Source-of-truth is the spec; this file captures conventions a fresh Claude session cannot discover from source.

## Read before any work

@.claude/rules/scope.md
@.claude/rules/doc-density.md
@DENSITY_BUDGET.md

Companion logs (read on demand):
- `DECISIONS.md` — resolved ambiguities
- `DEFERRED.md` — items cut from scope

## Spec

<!-- TODO: replace with your spec's path. The scope rule treats this as source-of-truth. -->
The spec is at `<TODO: path/to/spec.md>`. Treat the latest version as authoritative.

## End-of-session workflow

Run `/sp-done` to sync `TODO.md`, `DONE.md`, `DECISIONS.md`, `DEFERRED.md`, then commit and push.

## Build & test commands

<!-- TODO: list the commands a fresh session needs (e.g. `uv run pytest`, `make build`). Delete the section if there is no code yet. -->

## Project-specific notes

<!-- TODO: anything Claude needs that isn't derivable from source. Delete the section if not needed. -->
