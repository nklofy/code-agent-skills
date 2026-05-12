---
name: "openspec-change-planning"
description: "Plans OpenSpec changes by creating proposal, design, tasks, and delta specs. Invoke before implementing non-trivial features."
---

# OpenSpec Change Planning

## Purpose

Turn a user request into a scoped OpenSpec change with durable planning artifacts.

This skill creates and maintains the planning files that guide implementation. It does not write feature code except for tiny examples inside planning documents.

## When To Invoke

Invoke when the user asks to:

- plan a feature before coding
- create a new OpenSpec change
- write a proposal, design, or tasks file
- define requirements and scenarios for a behavior change
- clarify scope before implementation

Do not invoke for trivial edits unless the user explicitly wants a formal change.

## Inputs

Useful inputs include:

- user request or feature idea
- preferred change name
- affected capability names
- known constraints, risks, or non-goals
- existing specs that should be modified

## Repository Files

This skill may create or update:

- `openspec/changes/<change-name>/proposal.md`
- `openspec/changes/<change-name>/design.md`
- `openspec/changes/<change-name>/tasks.md`
- `openspec/changes/<change-name>/specs/<capability>/spec.md`

## Procedure

1. Clarify the change intent if needed.
2. Derive a concise kebab-case change name.
3. Identify affected capabilities.
4. Create the change directory.
5. Write or update `proposal.md` with Why, What Changes, and Impact.
6. Write `design.md` when behavior, architecture, APIs, or integrations change.
7. Write `tasks.md` as an actionable checklist.
8. Write delta specs for user-visible behavior or contract changes.
9. End with a readiness summary.

## Decision Rules

- Use `design.md` for architecture, API, data model, integration, or migration work.
- Use change specs when behavior, requirements, contracts, or user-visible outcomes change.
- Ask before splitting one request across multiple changes.
- Ask when capability boundaries are unclear.

## Guardrails

- Do not implement code while planning.
- Do not invent unstated business requirements when ambiguity affects behavior.
- Do not silently expand scope.
- Preserve existing user-authored planning content.
- Treat planning files as the source of truth once created.

## Output Format

```text
Using change: <change-name>
Status: planning

Created or updated:
- proposal.md
- design.md
- tasks.md
- specs/<capability>/spec.md

Ready for: <implementation|review|more planning>
Next action: <recommended next step>
```

## Examples

User: "Plan adding SSO login before coding."

Action: create a change directory, proposal, design, tasks, and an auth delta spec.
