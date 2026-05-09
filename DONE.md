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

## Hooks & Enforcement (2026-05-09)

| Task | Notes |
| --- | --- |
| Add warn-mode PostToolUse hook for file length budget enforcement | `.claude/hooks/check-density-budget.sh` + `.claude/settings.json`; fires on Write/Edit/MultiEdit, exits 2 with split reminder; fixed macOS `/tmp` symlink via `os.path.realpath` |
