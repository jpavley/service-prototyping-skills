# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repo Is

Canonical source of three opinionated rules for prototyping integration services. Consumer projects copy files from here. No package, no build, no test.

## Self-Application

The rules in this repo govern this repo. When editing any file here:

- Apply the prose conventions in `.claude/rules/doc-density.md` (forbidden phrases, table-over-list, no closing summaries).
- Stay under the length budgets in `templates/DENSITY_BUDGET.md`. This repo has no live `DENSITY_BUDGET.md`; treat the template as authoritative for files here.
- When a doc exceeds budget, **split it**, don't compress prose. (`README.md` → `SETUP.md` is the precedent.)

## Don't Fix the Cross-References

`.claude/rules/scope.md` mentions `DECISIONS.md` and `DEFERRED.md` at "repo root". `.claude/rules/doc-density.md` mentions `DENSITY_BUDGET.md` at "repo root". These point to the *consumer's* repo root, not this one. Templates live in `templates/`; live versions do not exist here. Do not rewrite the references to point at `templates/...` — they are correct as-is.

## Workflow

1. Edit canonical files in `.claude/rules/`, `skills/api-discovery/`, or `templates/`.
2. No auto-propagation. Consumer projects pull updates by repeating `SETUP.md`'s copy steps for the changed file(s).
3. `README.md` is the conceptual map ("what is this?"). `SETUP.md` is the procedure ("how do I install it?"). Keep them apart.

## Verification (No Build, No Tests)

Before committing changes, run these checks:

| Check | Reference |
| --- | --- |
| Line counts under budget | `templates/DENSITY_BUDGET.md` |
| Doc-density self-check passes | bottom of `.claude/rules/doc-density.md` |
| Scope self-check (when touching code or spec) | bottom of `.claude/rules/scope.md` |
