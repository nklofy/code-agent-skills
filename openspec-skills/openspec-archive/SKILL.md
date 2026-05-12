---
name: "openspec-archive"
description: "Archives completed OpenSpec changes safely. Invoke when tasks are done and the user wants to finalize a change."
---

# OpenSpec Archive

## Purpose

Finalize a completed OpenSpec change by moving it to the archive only when it is safe to do so.

This skill is the lifecycle closing step. It should not implement new work or perform complex spec edits unless the user explicitly asks for pre-archive fixes.

## When To Invoke

Invoke when the user asks to:

- archive a change
- finalize a completed change
- move a change to `archive/`
- complete the OpenSpec lifecycle
- clean up after implementation and spec sync

## Inputs

Useful inputs include:

- change name
- whether incomplete tasks are accepted
- whether spec sync should be required before archive
- archive date or default current date

## Repository Files

This skill reads:

- `openspec/changes/<change-name>/tasks.md`
- `openspec/changes/<change-name>/proposal.md`
- `openspec/changes/<change-name>/design.md`
- `openspec/changes/<change-name>/specs/**/spec.md`
- `openspec/specs/**/spec.md`

This skill moves:

- `openspec/changes/<change-name>/`
- to `openspec/changes/archive/YYYY-MM-DD-<change-name>/`

## Procedure

1. Identify the target change.
2. Check whether the change is already archived.
3. Inspect `tasks.md` for incomplete items.
4. Check whether approved change specs still need syncing.
5. Verify no obvious artifact contradiction remains.
6. Ask for confirmation if tasks are incomplete or sync is skipped.
7. Move the change directory into archive.
8. Report the archive path and final status.

## Decision Rules

- Do not archive incomplete tasks unless the user explicitly accepts them.
- Do not archive when required spec sync is pending unless the user explicitly skips it.
- If the archive target already exists, ask before choosing a new path.
- If the change is already archived, report that state instead of moving it again.

## Guardrails

- Do not delete change history.
- Do not silently skip unresolved work.
- Do not implement feature code.
- Do not perform broad spec rewrites.
- Preserve archive path clarity with a date prefix.

## Output Format

```text
Using change: <change-name>
Status: ready-to-archive

Archived to:
- openspec/changes/archive/YYYY-MM-DD-<change-name>/

Skipped or warnings:
- <item or none>

Next action: <recommended next step>
```

## Examples

User: "Archive add-user-auth."

Action: check tasks and spec sync state, then move the change to the dated archive directory if safe.
