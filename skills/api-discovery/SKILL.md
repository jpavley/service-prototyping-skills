# API Discovery

Build a domain skill from observed API behavior — not vendor docs, not memory.

## When to Use

Before writing integration code against any third-party API where:

- Response shapes matter (almost always)
- A tested domain skill for the API does not yet exist
- Vendor docs are incomplete, outdated, or known to lie

## Pipeline

1. **Confirm access.** Check for public docs, public sandbox, or unauthenticated endpoints before treating credentials as a blocker. If genuinely blocked, scaffold `skills/<api-name>/SKILL.md` from the Output Template (preserve the Contents column as imperatives, leave bodies empty), log the blocker as a TODO, and stop.
2. **Probe.** In a sandbox, hit every endpoint the integration will need. Capture full request/response pairs to `discovery/<api-name>/raw/`. One file per endpoint, named by HTTP verb and path.
3. **Diff against vendor docs.** For each endpoint, note where the actual response differs from what vendor docs claim. Wrong types, missing fields, fields present but always null, undocumented fields, pagination behavior, error shapes.
4. **Distill.** Write `skills/<api-name>/SKILL.md` from observations only. Do not import vendor doc text. If you didn't observe it, it doesn't go in the skill.
5. **Verify.** Have Claude write the integration against the new skill. Every time it asks a question the skill should have answered, the skill is incomplete — update it before continuing.

## Output Template for `skills/<api-name>/SKILL.md`

| Section | Contents |
|---|---|
| Auth | Exact header/token format. Token lifetime. Refresh flow. Where the credential lives. |
| Endpoints | Table: method, path, purpose, observed rate limit. |
| Response shapes | Real captured JSON, trimmed but not retyped. Mark fields whose declared type lies (e.g. "`count` is string, not int"). |
| Pagination | Style (cursor/offset/Link header). Real example of one paginated request and its successor. |
| Errors | Real captured error responses by status code. Include the body, not just the code. |
| Quirks | Behaviors that contradict vendor docs. One line each. |
| Forbidden | Endpoints or operations the integration must never call. |

## Anti-patterns

- Declaring a credentials blocker without first checking for public docs, public sandbox, or unauthenticated endpoints
- Writing the skill from vendor docs and "verifying later"
- Sanitizing real responses into TypeScript/Pydantic type definitions (lossy)
- Omitting quirks because "they might get fixed"
- Skipping endpoints the current integration doesn't need (the next integration will)
- Using Claude's memory of similar APIs as a substitute for probing this one

## Maintenance

When integration code reveals a new API behavior, the skill is wrong before the code is. Update the skill first, then the code. Treat the skill as the source of truth; treat surprising production behavior as a skill bug.

## Output of Running This Skill

- `discovery/<api-name>/raw/` — one captured request/response per endpoint
- `discovery/<api-name>/diff.md` — vendor doc deviations, one line each
- `skills/<api-name>/SKILL.md` — the distilled domain skill, ready for the next integration
