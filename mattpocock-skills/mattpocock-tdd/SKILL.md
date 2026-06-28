# Mattpocock Test-Driven Development

Use Mattpocock TDD to build one vertical slice at a time. The point is not "more tests"; it is better design feedback. A good test pressures the module interface before implementation hardens around the wrong shape.

## When To Use

Use when the user wants to implement a feature or bug fix test-first, asks for red-green-refactor, wants behavior tests, or needs safer code changes through a public interface.

## Core Principles

- Test observable behavior through public interfaces.
- Avoid tests that know private helpers, call order, or internal object graphs.
- Write one failing test, make it pass, then decide the next test.
- Never batch all tests first and all implementation second.
- Refactor only when the current tests are green.

## Planning

Before editing code:

1. Read `CONTEXT.md`, `CONTEXT-MAP.md`, and relevant ADRs if present.
2. Identify the behavior to deliver in this slice.
3. Use `mattpocock-codebase-design` language to choose the test seam.
4. Confirm with the user if the public interface or priority behavior is ambiguous.
5. List the first 1-3 behaviors to test, ordered by risk.

Ask only what changes implementation direction. Do not ask for permission on obvious local mechanics.

## Red-Green Loop

For each behavior:

```text
RED: write one test that fails for the right reason.
GREEN: write the smallest useful implementation that passes.
CHECK: run the focused test.
REPEAT: add the next behavior only after green.
```

The first test is a tracer bullet: it proves the chosen seam can exercise real code end to end.

## Good Tests

Good tests read like product or caller behavior:

- "user can checkout with a valid cart"
- "expired invitation cannot be accepted"
- "retryable payment failure is surfaced as pending"

They:

- use the public interface
- avoid private state
- survive internal rewrites
- verify outcomes, not implementation sequence
- keep setup meaningful, not exhaustive

## Bad Tests

Treat these as warning signs:

- mocking modules the project owns
- asserting that function A called function B
- testing private methods directly
- querying storage to verify behavior when a public read path exists
- snapshotting broad output that hides the actual behavior under test
- failing after a refactor that preserves behavior

## Mocking Rule

Mock at true system edges:

- third-party APIs
- time, randomness, and clock behavior
- filesystem when no local test stand-in is practical
- external services the repo does not own

Prefer local substitutes over mocks for dependencies the project can run locally, such as in-memory stores, test databases, fake queues, or SDK-shaped adapters.

## Refactor Step

After green, inspect for:

- duplication created by the slice
- shallow modules whose interface adds no leverage
- logic in the wrong module
- primitive values that should become domain concepts
- awkward test setup that reveals a bad seam

Run tests after each refactor. If a refactor needs behavior changes, stop and start a new red-green cycle.

## Completion

Before final response:

- run the relevant tests
- report what passed
- name any tests you could not run
- summarize the behavior delivered, not just files changed
