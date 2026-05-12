---
name: "openspec-artifact-status"
description: "Evaluates OpenSpec change status and artifact readiness. Invoke when checking progress, blockers, or the next action."
---

# OpenSpec Artifact Status

## Purpose

Determine the state of an OpenSpec change from files on disk and recommend the next action.

This skill observes and reports. It should not make broad edits unless the user explicitly asks for a small correction.

## When To Invoke

Invoke when the user asks to:

- check a change status
- find blockers
- determine the next action
- inspect artifact readiness
- understand whether a change is ready for implementation, sync, or archive

## Inputs

Useful inputs include:

- change name
- project root
- optional capability name
- current user intent, such as planning, implementing, syncing, or archiving

## Repository Files

This skill reads:

- `openspec/changes/<change-name>/proposal.md`
- `openspec/changes/<change-name>/design.md`
- `openspec/changes/<change-name>/tasks.md`
- `openspec/changes/<change-name>/specs/**/spec.md`
- `openspec/specs/**/spec.md`
- `openspec/changes/archive/`

## Procedure

1. Identify the active change.
2. If multiple active changes match, ask the user to choose.
3. Inspect proposal, design, tasks, change specs, and relevant main specs.
4. Classify each artifact as `missing`, `draft`, `ready`, `stale`, or `done`.
5. Classify the overall change status.
6. Identify the highest-priority blocker.
7. Recommend exactly one next action.

## Status Model

Artifact states:

- `missing`: required file does not exist
- `draft`: file exists but is incomplete or placeholder-heavy
- `ready`: file is sufficient for downstream work
- `stale`: file conflicts with newer decisions or implementation
- `done`: file has served its purpose and remains consistent

Change states:

- `uninitialized`
- `scaffolding`
- `planning`
- `ready-for-implementation`
- `implementing`
- `needs-spec-sync`
- `ready-to-archive`
- `archived`
- `blocked`

## Decision Rules

- Missing or stale proposal blocks planning.
- Missing or stale required design blocks implementation.
- Missing or stale tasks blocks implementation.
- Missing or stale required specs block implementation or sync.
- Incomplete tasks block archive unless the user explicitly accepts them.

## Guardrails

- Do not assume a change when multiple active changes exist.
- Do not mark a change ready if required artifacts are missing.
- Do not archive or sync; recommend those actions instead.
- Report uncertainty clearly.

## Output Format

```text
Change: <change-name>
Status: <status>
Proposal: <state>
Design: <state>
Tasks: <state>
Change specs: <state>
Main specs: <state|n/a>
Blocking issue: <one sentence>
Next action: <one sentence>
```

## Examples

User: "What is next for add-user-auth?"

Action: inspect the change and return its status summary with one recommended next action.
