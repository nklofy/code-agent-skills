# Mattpocock Skills

This is a small, agent-neutral skill bundle for turning ideas into shipped software. It is plain Markdown: no command-prefix requirement, no platform-specific fields, and no mandatory manifest.

## Operating Model

1. Clarify the idea.
2. Write the product decision document.
3. Split the work into vertical issues.
4. Implement one behavior at a time with tests.
5. Improve architecture when the codebase becomes hard to change or test.

## Skills

All skills are flat in this directory:

- [`mattpocock-delivery-workflow`](./mattpocock-delivery-workflow/SKILL.md) — choose the next step.
- [`mattpocock-grill-me`](./mattpocock-grill-me/SKILL.md) — pressure-test a rough idea through the full interview loop.
- [`mattpocock-to-prd`](./mattpocock-to-prd/SKILL.md) — synthesize the conversation into a PRD.
- [`mattpocock-to-issues`](./mattpocock-to-issues/SKILL.md) — split a plan into independently usable issues.
- [`mattpocock-tdd`](./mattpocock-tdd/SKILL.md) — implement with red-green-refactor.
- [`mattpocock-improve-codebase-architecture`](./mattpocock-improve-codebase-architecture/SKILL.md) — find shallow modules and deepening opportunities.
- [`mattpocock-codebase-design`](./mattpocock-codebase-design/SKILL.md) — shared language for deep modules, seams, adapters, leverage, and locality.
- [`mattpocock-domain-modeling`](./mattpocock-domain-modeling/SKILL.md) — maintain domain vocabulary and lightweight ADRs.

## Natural-Language Triggers

These skills do not require command prefixes. Any agent can invoke them when the user says things like:

- "Help me flesh out this idea."
- "Turn this conversation into a PRD."
- "Break this plan into implementation issues."
- "Build this test-first."
- "Review the architecture and find simplification opportunities."

Direct Mattpocock Grill Me example:

```text
I have an idea for team invitations, but it is still fuzzy. Interview me one question at a time, recommend an answer for each question, and keep going until the first shippable slice is clear.
```

## Defaults

The bundle works without setup:

- PRDs and issues are written as local Markdown under `.scratch/<feature-slug>/`.
- Domain vocabulary is read from `CONTEXT.md` when present.
- ADRs are read from `docs/adr/` when present.
- Missing docs are not errors.

If source material lives outside the repo, ask the user to paste it or provide an exported Markdown/text document. This bundle writes local Markdown artifacts; moving them into another system is outside the core workflow.

## Porting

To use this bundle in another agent:

1. Copy the `mattpocock-skills/` directory.
2. Point the agent at this README or at individual `SKILL.md` files.
3. Use each skill's "When To Use" section as its invocation rule.

No file in this package requires a specific agent runtime.

## Release Check

Before publishing the bundle elsewhere, run through [`CHECKLIST.md`](./CHECKLIST.md).

For a compact end-to-end example, see [`examples/idea-to-issues.md`](./examples/idea-to-issues.md).
