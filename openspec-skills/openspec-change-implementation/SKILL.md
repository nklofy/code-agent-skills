---
name: "openspec-change-implementation"
description: "Implements an OpenSpec change by following proposal, design, tasks, and specs. Invoke when coding from an approved plan."
---

# OpenSpec Change Implementation

## Purpose

Implement a planned OpenSpec change while keeping code, tasks, and specs aligned.

This skill is the coding execution step. It should only proceed when planning artifacts are ready enough to guide implementation.

## When To Invoke

Invoke when the user asks to:

- implement an approved change
- continue coding from `tasks.md`
- perform the next task
- apply a planned design
- keep implementation aligned with OpenSpec artifacts

Do not invoke when proposal, required design, tasks, or required specs are missing or stale.

## Inputs

Useful inputs include:

- change name
- selected task number
- implementation scope
- test command or validation method
- relevant files or modules

## Repository Files

This skill reads:

- `openspec/changes/<change-name>/proposal.md`
- `openspec/changes/<change-name>/design.md`
- `openspec/changes/<change-name>/tasks.md`
- `openspec/changes/<change-name>/specs/**/spec.md`
- `openspec/specs/**/spec.md`

This skill may update:

- source code files
- tests
- `tasks.md`
- planning artifacts only when implementation reveals a mismatch

## Procedure

1. Identify the active change.
2. Read proposal, design, tasks, and relevant specs.
3. Confirm the change is ready for implementation or already implementing.
4. Select the next unchecked task unless the user specified one.
5. Implement the task in a small, reviewable step.
6. Run focused validation when practical.
7. Update `tasks.md` immediately after completing work.
8. If implementation reveals a spec or design mismatch, stop and update planning artifacts before continuing.

## Decision Rules

- If tasks are missing or vague, switch to planning instead of coding.
- If the implementation would expand scope, ask the user.
- If code contradicts requirements, stop and resolve the contradiction.
- If a focused test materially reduces regression risk, add or update it.

## Guardrails

- Do not silently implement beyond the approved scope.
- Do not leave completed tasks unchecked.
- Do not use chat as the only record of decisions.
- Do not archive or sync specs unless explicitly asked.
- Preserve unrelated user changes.

## Output Format

```text
Using change: <change-name>
Status: implementing

Completed:
- <task or outcome>

Updated:
- <file>

Validation:
- <command or note>

Next action: <recommended next step>
```

## Examples

User: "Implement the next task in add-user-auth."

Action: read the artifacts, implement the next unchecked task, update `tasks.md`, and report validation.
