---
name: "openspec-spec-sync"
description: "Syncs OpenSpec delta specs into main specs. Invoke when applying approved change specs to canonical specifications."
---

# OpenSpec Spec Sync

## Purpose

Apply approved change-level delta specs into canonical main specs.

This skill updates requirements documentation. It does not implement code or archive changes.

## When To Invoke

Invoke when the user asks to:

- sync specs
- merge change specs into main specs
- apply approved spec deltas
- update canonical requirements after a change
- prepare a change for archive after implementation

## Inputs

Useful inputs include:

- change name
- capability name
- whether to dry-run or actually update files
- whether ambiguous deltas should be resolved interactively

## Repository Files

This skill reads:

- `openspec/changes/<change-name>/specs/<capability>/spec.md`

This skill creates or updates:

- `openspec/specs/<capability>/spec.md`

## Procedure

1. Identify the target change.
2. Find all change spec files under `openspec/changes/<change-name>/specs/`.
3. Locate corresponding main specs under `openspec/specs/`.
4. Parse delta sections.
5. Apply `ADDED Requirements`.
6. Apply `MODIFIED Requirements`.
7. Apply `REMOVED Requirements`.
8. Apply `RENAMED Requirements`.
9. Validate that main specs contain normal requirements only.
10. Report updated capabilities and counts.

## Decision Rules

- If a modified or removed requirement cannot be found, ask before inventing behavior.
- If a main spec does not exist, create it only when the delta clearly defines a new capability.
- If two delta operations conflict, stop and ask for resolution.
- Do not leave delta headers in main specs.

## Guardrails

- Do not archive the change.
- Do not edit code.
- Do not silently drop requirements.
- Do not rewrite unrelated sections of main specs.
- Preserve requirement scenarios unless intentionally modified.

## Output Format

```text
Using change: <change-name>
Status: needs-spec-sync

Updated main specs:
- openspec/specs/<capability>/spec.md

Applied:
- Added: <n>
- Modified: <n>
- Removed: <n>
- Renamed: <n>

Next action: <recommended next step>
```

## Examples

User: "Sync the auth spec from add-user-auth."

Action: apply auth delta requirements into `openspec/specs/auth/spec.md` and report counts.
