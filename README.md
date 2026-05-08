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

From your project's repo root:

```bash
SOURCE=/Users/johnpavley/Developer/service-prototyping-skills

mkdir -p .claude/rules skills/api-discovery
cp "$SOURCE/.claude/rules/"*.md .claude/rules/
cp "$SOURCE/skills/api-discovery/SKILL.md" skills/api-discovery/

# Companion files at repo root — copy once, then edit per project
for f in DENSITY_BUDGET.md DECISIONS.md DEFERRED.md; do
  [ -f "$f" ] || cp "$SOURCE/templates/$f" .
done
```

Then add a pointer to `CLAUDE.md` so Claude reads the rules each session:

```
Before any work, read:
- `.claude/rules/scope.md` — scope discipline
- `.claude/rules/doc-density.md` — doc length and prose
- `DENSITY_BUDGET.md` — per-project length caps
- `DECISIONS.md` and `DEFERRED.md` — running logs
```

## How the Files Reference Each Other

- `scope.md` reads from `DECISIONS.md`, writes to `DEFERRED.md`.
- `doc-density.md` reads from `DENSITY_BUDGET.md`.
- `api-discovery/SKILL.md` produces new skills under `skills/<api-name>/` for each integration.

## Updating

These files are canonical here. To propagate a change, re-run the `cp` commands above. Don't edit the copies in your projects — they will drift.
