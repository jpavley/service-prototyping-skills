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

Make sure you have a copy of this repository on your computer (cloned with git or downloaded and extracted).

**Step 1.** In your project's root directory, create two new folders:

- `.claude/rules`
- `skills/api-discovery`

**Step 2.** Copy these six files from this repository into your project. Keep the same folder layout:

| File in this repository         | Where it goes in your project |
| ------------------------------- | ----------------------------- |
| `.claude/rules/scope.md`        | `.claude/rules/`              |
| `.claude/rules/doc-density.md`  | `.claude/rules/`              |
| `skills/api-discovery/SKILL.md` | `skills/api-discovery/`       |
| `templates/DENSITY_BUDGET.md`   | root directory                |
| `templates/DECISIONS.md`        | root directory                |
| `templates/DEFERRED.md`         | root directory                |

If your project already has `DENSITY_BUDGET.md`, `DECISIONS.md`, or `DEFERRED.md`, leave them in place — do not overwrite.

**Step 3.** Open your project's `CLAUDE.md` (create one in the root directory if it does not exist) and add these lines:

```
Before any work, read:
- `.claude/rules/scope.md` — scope discipline
- `.claude/rules/doc-density.md` — doc length and prose
- `DENSITY_BUDGET.md` — per-project length caps
- `DECISIONS.md` and `DEFERRED.md` — running logs
```

**Step 4.** Open `DENSITY_BUDGET.md` in your project. The default line caps are a starting point — adjust them if your project needs different limits.

When you are done, your project should include these files:

```
your-project/
├── CLAUDE.md
├── DECISIONS.md
├── DEFERRED.md
├── DENSITY_BUDGET.md
├── .claude/rules/
│   ├── scope.md
│   └── doc-density.md
└── skills/api-discovery/
    └── SKILL.md
```

## How the Files Reference Each Other

- `scope.md` reads from `DECISIONS.md`, writes to `DEFERRED.md`.
- `doc-density.md` reads from `DENSITY_BUDGET.md`.
- `api-discovery/SKILL.md` produces new skills under `skills/<api-name>/` for each integration.

## Updating

These files are canonical here. When you change one, copy it again into each project that uses it. Don't edit the copies in your projects — they will drift.
