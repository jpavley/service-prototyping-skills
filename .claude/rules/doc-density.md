# Documentation Density Rule

High signal per page. Verbose docs hide the information.

## Required Patterns

| Use | Instead of |
|---|---|
| Table | Bulleted list of parallel items |
| One summary at top of doc | Summary at top + restated conclusion at bottom |
| Named sub-section | Long paragraph covering multiple concepts |
| Concrete example with real values | Abstract description |
| Active voice, present tense | "It will be the case that..." |
| Imperative ("Do X") | Hedged ("You may want to consider X") |

## Forbidden Phrases

- "In this section we will..."
- "As discussed previously..."
- "It is important to note that..."
- "It should be mentioned that..."
- "Various", "numerous", "a number of", "a variety of"
- Closing summaries that restate the opening
- Section intros that paraphrase the section heading

## Length Budgets

Per-project caps live in `DENSITY_BUDGET.md` at repo root. Read it before writing or editing docs.

If a doc exceeds its budget, **split it**. Do not compress prose to fit. Splitting forces the seams; compression hides them.

## Self-Check

- [ ] Every paragraph carries information not in another paragraph.
- [ ] Every table row earns its row.
- [ ] Removing the closing paragraph would lose nothing.
- [ ] No section header just restates the parent heading.
- [ ] Doc length is under budget or split into named children.
