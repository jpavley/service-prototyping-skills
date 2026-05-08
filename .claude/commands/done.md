---
description: End session - update docs, commit, and push
model: claude-sonnet-4-6
---

End-of-session workflow: Update documentation and commit all changes.

## Steps

1. **Review current session work**
   - Check git status and diff to see all changes made
   - Review the conversation to identify completed tasks, resolved decisions, and items deferred

2. **Sync `TODO.md` and `DONE.md`** (both in project root, under git control)
   - When a task is completed: move its table row (and any notes) from `TODO.md` to the matching heading in `DONE.md`
   - If the task heading doesn't exist in `DONE.md` yet, add it
   - If all subtasks under a heading are done, remove the heading from `TODO.md`
   - If a heading has a mix of done/pending, keep the heading in both files with the appropriate rows
   - Add any new planned tasks discovered during the session to `TODO.md`
   - Both files share the same task headings — items are in one or the other, never both

3. **Sync decision logs** (per `.claude/rules/scope.md`)
   - If ambiguity was resolved this session: append a row to `DECISIONS.md`
   - If items were cut from scope: append a row to `DEFERRED.md`
   - If a third-party API revealed new behavior: update `skills/<api-name>/SKILL.md` first per `skills/api-discovery/SKILL.md` (skill before code)

4. **Update project instructions** (only if behavioral rules or architecture changed)
   Use the layer architecture to decide WHERE updates belong:
   - **CLAUDE.md** — Governance only (target: under 80 lines per `DENSITY_BUDGET.md`). Behavioral constraints in imperative voice. Strategic direction. Build commands. Only add rules that change Claude's behavior in ways Claude can't discover by reading source code. Remove stale rules when adding new ones.
   - **.claude/rules/*.md** — Domain-specific reference (auto-loaded). Architecture constraints, coding conventions. Apply `.claude/rules/doc-density.md` to prose: forbidden phrases, table-over-list, no closing summaries. Stay under per-file budgets in `DENSITY_BUDGET.md`.
   - **Skip this step** if the session was purely implementation with no new rules or pattern changes.

5. **Commit and push**
   - Stage all project-relevant changes including `TODO.md`, `DONE.md`, and any synced decision logs
   - Write a clear commit message summarizing the session's work
   - Push to remote

## Important

- Ask for confirmation before committing if there are unexpected changes
- Do NOT commit files containing secrets (.env, credentials, etc.)
- Include "Co-Authored-By: Claude" in commit message
