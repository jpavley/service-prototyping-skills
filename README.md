# Service Prototyping Skills

Three opinionated rules for prototyping integration services. Copy them into a project, fill in the companion files, and Claude has the discipline you would otherwise re-explain every session.

## What's Here

| Path                            | Purpose                                                                       |
| ------------------------------- | ----------------------------------------------------------------------------- |
| `.claude/rules/scope.md`        | What to build, what to defer. Forbids defensive coding not named in the spec. |
| `.claude/rules/doc-density.md`  | High signal per page. Forbidden phrases, length budgets.                      |
| `skills/api-discovery/SKILL.md` | Build per-API domain skills from observed behavior, not vendor docs.          |
| `templates/DENSITY_BUDGET.md`   | Per-project length caps the density rule enforces.                            |
| `templates/DECISIONS.md`        | Resolved spec ambiguity. Consulted by `scope.md`.                             |
| `templates/DEFERRED.md`         | Items cut from scope. Written by `scope.md`.                                  |

## Setup

See [SETUP.md](SETUP.md). Four steps: create folders, copy six files, point your `CLAUDE.md` at the rules, tune `DENSITY_BUDGET.md`.

## How the Files Reference Each Other

- `scope.md` reads from `DECISIONS.md`, writes to `DEFERRED.md`.
- `doc-density.md` reads from `DENSITY_BUDGET.md`.
- `api-discovery/SKILL.md` produces new skills under `skills/<api-name>/` for each integration.

## Updating

These files are canonical here. When you change one, copy it again into each project that uses it. Don't edit the copies in your projects — they will drift.
