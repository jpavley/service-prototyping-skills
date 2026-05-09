# Setup

How to drop these skills into a project.

Prefer to automate? Run `scripts/install.sh /path/to/your/project` from this repository. The steps below are equivalent — read them to understand what the script does.

Make sure you have a copy of this repository on your computer (cloned with git or downloaded and extracted).

**Step 1.** In your project's root directory, create three new folders:

- `.claude/rules`
- `.claude/commands`
- `skills/api-discovery`

**Step 2.** Copy these ten files from this repository into your project. Keep the same folder layout:

| File in this repository         | Where it goes in your project |
| ------------------------------- | ----------------------------- |
| `.claude/rules/scope.md`        | `.claude/rules/`              |
| `.claude/rules/doc-density.md`  | `.claude/rules/`              |
| `.claude/commands/sp-done.md`   | `.claude/commands/`           |
| `skills/api-discovery/SKILL.md` | `skills/api-discovery/`       |
| `templates/CLAUDE.md`           | root directory                |
| `templates/DENSITY_BUDGET.md`   | root directory                |
| `templates/DECISIONS.md`        | root directory                |
| `templates/DEFERRED.md`         | root directory                |
| `templates/TODO.md`             | root directory                |
| `templates/DONE.md`             | root directory                |

If your project already has any of `CLAUDE.md`, `DENSITY_BUDGET.md`, `DECISIONS.md`, `DEFERRED.md`, `TODO.md`, or `DONE.md`, leave them in place — do not overwrite.

**Step 3.** Open `CLAUDE.md`:

- **Fresh install:** the template was copied in. Fill in the `<TODO: ...>` slots (spec path, build commands). The rule imports (`@.claude/rules/scope.md`, etc.) are already wired.
- **Existing CLAUDE.md:** add the rule imports manually:

  ```
  @.claude/rules/scope.md
  @.claude/rules/doc-density.md
  @DENSITY_BUDGET.md
  ```

**Step 4.** Open `DENSITY_BUDGET.md` in your project. The default line caps are a starting point — adjust them if your project needs different limits.

**Step 5.** If the directory is not yet under version control, initialize git and make a first commit:

```
git init
git add .
git commit -m "Initial commit: service-prototyping-skills"
```

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
│   │   └── sp-done.md
│   └── rules/
│       ├── doc-density.md
│       └── scope.md
└── skills/api-discovery/
    └── SKILL.md
```
