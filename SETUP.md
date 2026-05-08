# Setup

How to drop these skills into a project.

Make sure you have a copy of this repository on your computer (cloned with git or downloaded and extracted).

**Step 1.** In your project's root directory, create three new folders:

- `.claude/rules`
- `.claude/commands`
- `skills/api-discovery`

**Step 2.** Copy these nine files from this repository into your project. Keep the same folder layout:

| File in this repository         | Where it goes in your project |
| ------------------------------- | ----------------------------- |
| `.claude/rules/scope.md`        | `.claude/rules/`              |
| `.claude/rules/doc-density.md`  | `.claude/rules/`              |
| `.claude/commands/done.md`      | `.claude/commands/`           |
| `skills/api-discovery/SKILL.md` | `skills/api-discovery/`       |
| `templates/DENSITY_BUDGET.md`   | root directory                |
| `templates/DECISIONS.md`        | root directory                |
| `templates/DEFERRED.md`         | root directory                |
| `templates/TODO.md`             | root directory                |
| `templates/DONE.md`             | root directory                |

If your project already has any of `DENSITY_BUDGET.md`, `DECISIONS.md`, `DEFERRED.md`, `TODO.md`, or `DONE.md`, leave them in place — do not overwrite.

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
├── DONE.md
├── TODO.md
├── .claude/
│   ├── commands/
│   │   └── done.md
│   └── rules/
│       ├── doc-density.md
│       └── scope.md
└── skills/api-discovery/
    └── SKILL.md
```
