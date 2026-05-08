# Scope Rule

Demo-grade. Ship only what the spec describes. Defer everything else.

## Build / Defer

| Build | Defer |
|---|---|
| Behavior explicitly named in the spec | Anything not in the spec |
| One happy-path integration test against real APIs | Unit tests, mocks, fixtures |
| Hardcoded values matching the spec | Configurability, env switches, feature flags |
| Single interpretation of ambiguous spec | Building for multiple interpretations |
| Plain logging at major step boundaries | Structured logging, correlation IDs, metrics |

## Defensive Coding

Forbidden unless the spec names it:

- try/except wrappers
- Retry logic, backoff, circuit breakers
- Input validation beyond what the type system enforces
- Null checks beyond what the type system requires
- Idempotency keys, dedup logic, distributed locks

If the demo crashes on a missing field, that is information. Suppressing it is not.

## Ambiguity Protocol

1. Check `DECISIONS.md`. If decided, follow it. Do not re-ask.
2. If undecided: ask ONE question OR pick the simplest interpretation. Not both.
3. If you pick: note it in the PR description under `Assumptions:`.

## Deferred Items

Anything you would have built but didn't goes in `DEFERRED.md` as one line:

`feature-name: one-line reason it was deferred`

Do not build it. Do not stub it. Do not add a TODO comment in the code.

## Self-Check Before Submitting

- [ ] Every line of code traces to a line in the spec.
- [ ] No try/except blocks not named in the spec.
- [ ] No tests beyond happy-path integration.
- [ ] No README or doc changes beyond what was asked.
- [ ] Anything cut went into `DEFERRED.md`, not into the code as a TODO.
