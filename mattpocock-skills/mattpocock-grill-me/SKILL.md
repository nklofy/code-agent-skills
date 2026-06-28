# Mattpocock Grill Me

Stress-test a rough idea through a focused interview until the open decisions are explicit.

This skill is intentionally stateless: it does not create files, issue tickets, or domain docs unless the user asks for that next step.

## When To Use

Use this when:

- the user has an idea but the scope is fuzzy
- a design needs pressure before implementation
- the next step is unclear
- the user asks to be grilled, challenged, or interviewed

If the idea lives inside a codebase, inspect relevant files before asking questions. If it is not codebase-specific, work from the conversation only.

## Core Rule

Ask exactly one question at a time. Multiple questions create false certainty because the user answers the easy ones and skips the load-bearing ones.

Each question must include your recommended answer and why. The recommendation gives the user something concrete to accept, reject, or modify.

Use this format:

```text
Question: ...
Recommended answer: ...
Why: ...
```

## Process

1. Summarize the idea in one short paragraph.
2. Identify the highest-risk unresolved decision.
3. Ask one load-bearing question.
4. Wait for the user's answer.
5. Track resolved decisions, open decisions, blocked decisions, and assumptions.
6. Continue until every decision that changes the next step is resolved.
7. End with a compact decision summary.

## Good Questions

Good questions force a decision:

- Which actor matters most?
- What must be true before this can ship?
- What failure mode would make this unacceptable?
- Which behavior is in scope for the first slice?
- What should the public interface hide?

Avoid broad prompts like "anything else?" unless the design tree is already resolved.

## Stop Criteria

Stop when:

- the goal is specific enough to document or implement
- the first vertical slice is obvious
- remaining unknowns are explicitly out of scope
- no question would materially change the next step

## Final Summary

End with:

- resolved decisions
- remaining assumptions
- explicit out-of-scope items
- recommended next skill

## Next-Skill Guidance

- Use Mattpocock To PRD when the result needs a durable product document.
- Use Mattpocock To Issues when there is already a PRD or plan to break down.
- Use Mattpocock TDD when the first implementation slice is small enough to build now.
- Use Mattpocock Improve Codebase Architecture when the discussion revealed architecture friction rather than feature uncertainty.

## Quality Bar

A good session makes hidden choices visible. It should produce fewer vague nouns, fewer optional paths, and a clear first slice.
