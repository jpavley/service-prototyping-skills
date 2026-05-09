# DONE

Completed work, grouped under the same headings as `TODO.md`. Append-only.

See `.claude/commands/sp-done.md` for the sync workflow.

## Initial Build (2026-05-08)

| Task | Notes |
| --- | --- |
| Bootstrap canonical structure from three loose files | Organized into `.claude/rules/`, `skills/`, `templates/` |
| Write `README.md`, `SETUP.md`, `CLAUDE.md` | Split README→SETUP for density; CLAUDE.md captures self-application rules |
| Integrate `/done` command | Reconciled: 80-line CLAUDE.md cap, no `docs/` tier, DECISIONS/DEFERRED/skills step |
| Add `scripts/install.sh` and `scripts/update.sh` | `install.sh` idempotent; `update.sh` preserves user state, diffs `DENSITY_BUDGET.md` |

## Installer & Templates (2026-05-09)

| Task | Notes |
| --- | --- |
| Add `templates/CLAUDE.md` skeleton | 30 lines; `@`-imports rules pre-wired; TODO slots for spec path + build commands; copied by install (never by update) |
| Update `scripts/install.sh` | Copies `CLAUDE.md` if missing; branches closing message on whether CLAUDE.md was fresh or preserved; detects missing git repo and prints init command |
| Update `scripts/update.sh` | Adds `CLAUDE.md` only if missing; never overwrites user-edited content |
| Update `README.md` and `SETUP.md` | Table row for `templates/CLAUDE.md`; SETUP now 5 steps (was 4), 10 files (was 9); Step 5 is `git init` |

## Hooks & Enforcement (2026-05-09)

| Task | Notes |
| --- | --- |
| Add warn-mode PostToolUse hook for file length budget enforcement | `.claude/hooks/check-density-budget.sh` + `.claude/settings.json`; fires on Write/Edit/MultiEdit, exits 2 with split reminder; fixed macOS `/tmp` symlink via `os.path.realpath` |
