---
name: "mini-openspec"
description: "A compact standalone OpenSpec workflow skill. Use when you want one lower-cost skill that can independently handle setup, planning, status, implementation, spec sync, archive, and lightweight host adaptation."
---

# Mini OpenSpec

Use this as the standalone, low-cost version of the OpenSpec workflow.

This skill is intended for the common scenario where the user installs only one
skill from this package and still wants the core benefits of spec-driven work:

- explicit planning before non-trivial code changes
- durable artifacts on disk, not just chat history
- clear readiness checks before implementation
- disciplined implementation aligned with plan and spec
- canonical spec updates after approved behavior changes
- safe archive and handoff when a change is complete

This skill should be sufficient by itself for many repositories.

The sibling `openspec-*` skills are optional upgrades, not dependencies. Mention
them only when:

- the user explicitly asks for a detailed skill
- a host already has the full suite installed and deeper specialization reduces risk
- a phase genuinely needs more detail than this file can reasonably carry

## What This Skill Covers

`mini-openspec` compresses the essential behavior of:

- `openspec-workflow-installer`
- `openspec-change-planning`
- `openspec-artifact-status`
- `openspec-change-implementation`
- `openspec-spec-sync`
- `openspec-archive`
- `openspec-tool-adapter`

Default assumption: stay inside `mini-openspec` and complete the needed phase
directly. Do not turn this into a router unless escalation is actually useful.

## When To Invoke

Invoke when:

- the user wants OpenSpec-style work with lower prompt and loading cost
- the repository needs a lightweight spec-driven workflow
- you need one skill that can cover setup, planning, status, implementation, sync, and archive
- the host has limited context budget or skill-loading overhead
- the task is moderately complex and benefits from durable planning artifacts

## When Not To Invoke

Do not use this skill as the primary workflow when:

- the user wants a trivial, one-line change with no meaningful planning overhead
- the user explicitly asks for a named sibling skill and wants its exact workflow
- the repository already has a strict required workflow that conflicts with OpenSpec

## Core Principles

- Specs and planning artifacts are the durable source of truth.
- Non-trivial work should be planned before implementation.
- File state on disk matters more than chat summaries.
- Implementation should follow approved artifacts, not replace them.
- Syncing and archiving happen after work is actually ready, not just "mostly done."
- Preserve user-authored files unless replacement is explicitly requested.

## Quick Start

When this is the only installed skill:

1. detect the current OpenSpec phase from files on disk
2. apply that phase's artifact and guardrail rules
3. emit the structured output and continue within this skill

## The Lifecycle

The normal lifecycle is:

1. Prepare the workflow
2. Define a change
3. Check readiness
4. Implement in bounded steps
5. Sync canonical specs
6. Archive safely

Not every request uses every phase, but you should always determine which phase
the user is currently in before taking action.

## Phase 0: Determine Current Phase

Before editing anything, determine which phase applies.

Ask:

- Is the repository missing `openspec/` or other workflow assets?
- Is there already an active change directory?
- Are planning artifacts present and usable?
- Are tasks still open?
- Did implementation change approved behavior?
- Is the change effectively complete?

Use these signals:

- no `openspec/`: `setup`
- no change artifacts yet: `planning`
- artifacts exist but readiness is unclear: `status`
- plan is sufficient and tasks remain: `implementation`
- behavior changed and delta specs must become canonical: `sync`
- tasks and specs are complete: `archive`

## Phase 1: Setup

Use setup when the repository is not ready for OpenSpec.

### Goals

- establish the minimum file structure
- avoid destructive replacement
- leave the repository ready for planning

### Minimum Structure

Create only what is needed:

- `openspec/`
- `openspec/specs/`
- `openspec/changes/`
- `openspec/changes/archive/`

Create `openspec/config.yaml` only when:

- it is missing and the workflow expects it, or
- the user explicitly wants configuration scaffolding

### Setup Checklist

1. Resolve the target project root.
2. Check whether `openspec/` already exists.
3. Detect whether host-specific skill or command directories exist.
4. Create missing OpenSpec directories only as needed.
5. Install or reference local skills and command prompts only if the user asks.
6. Report created, skipped, and preserved paths.

### Setup Guardrails

- Never delete existing workflow assets unless the user requests cleanup.
- Never overwrite `openspec/config.yaml` silently.
- Never install sample content into a real project without confirmation.
- Keep setup separate from feature planning unless the user asks to continue.

## Phase 2: Planning

Use planning for non-trivial feature work, behavior changes, or changes that need
durable scope control.

### Planning Outputs

Create or update:

- `openspec/changes/<change-name>/proposal.md`
- `openspec/changes/<change-name>/design.md` when architecture or interfaces change
- `openspec/changes/<change-name>/tasks.md`
- `openspec/changes/<change-name>/specs/<capability>/spec.md` when behavior or contract changes

### Change Name Rules

The change name should be:

- kebab-case
- short but descriptive
- centered on the user-visible capability or engineering change
- stable enough to remain meaningful later in archive

Good examples:

- `add-sso-login`
- `improve-retry-handling`
- `archive-expired-api-tokens`

### Proposal Content

Every proposal should answer:

- Why does this change exist?
- What is changing?
- What is explicitly out of scope?
- What impact or risk should reviewers know?

### Design Content

Write `design.md` when the change affects:

- architecture or system boundaries
- APIs or interfaces
- data model or persistence
- migrations
- integrations
- authorization or trust boundaries
- non-obvious error handling

For simple changes, a short design is enough. For complex changes, include:

- architecture overview
- component responsibilities
- data flow
- failure modes
- verification strategy

### Tasks Content

`tasks.md` should be an actionable execution checklist.

Good tasks are:

- ordered by dependency
- small enough to execute in one bounded step
- explicit enough that a future session can resume
- tied to validation, not just code edits

Prefer checkboxes and concrete language:

- [ ] add canonical session validation helper
- [ ] update login flow to use helper
- [ ] add focused regression test for expired session redirect

Avoid vague tasks:

- [ ] fix auth
- [ ] update system

### Delta Spec Content

Create change specs when the behavior, contract, or requirement changes.

Each spec should make it clear:

- which capability is changing
- what scenarios matter
- what the system must now do
- what downstream implementation must preserve

### Planning Guardrails

- Do not write production code while planning.
- Do not silently broaden scope.
- Do not invent unstated business requirements.
- Preserve user-authored planning content unless revision is requested.
- If the request is too large, split to a smaller first slice.

## Phase 3: Status

Use status when the next move is unclear or you need a readiness check from disk.

This phase is intentionally observational. Prefer reporting and recommending over editing.

### Files To Inspect

- `proposal.md`
- `design.md`
- `tasks.md`
- change specs under `openspec/changes/<change-name>/specs/`
- main specs under `openspec/specs/`
- archive location if completion is suspected

### Artifact State Model

Classify each artifact as one of:

- `missing`
- `draft`
- `ready`
- `stale`
- `done`

### Change State Model

Classify the overall change as one of:

- `uninitialized`
- `scaffolding`
- `planning`
- `ready-for-implementation`
- `implementing`
- `needs-spec-sync`
- `ready-to-archive`
- `archived`
- `blocked`

### Status Rules

- missing or stale proposal blocks planning confidence
- missing required design blocks implementation
- missing or vague tasks blocks implementation
- missing or stale required specs blocks implementation or sync
- incomplete tasks block archive unless the user explicitly accepts the gap

### Status Output Should End With

- current change state
- highest-priority blocker
- exactly one recommended next action

## Phase 4: Implementation

Use implementation only when planning artifacts are sufficient.

### Required Inputs Before Coding

Read first:

- `proposal.md`
- `design.md` if present or required
- `tasks.md`
- relevant change specs
- relevant main specs if behavior intersects canonical capabilities

### Implementation Procedure

1. Identify the active change.
2. Select the next unchecked task unless the user named one.
3. Implement the smallest correct step.
4. Run focused validation.
5. Update `tasks.md` immediately.
6. If implementation reveals a planning mismatch, stop and repair planning first.

### Implementation Guardrails

- Do not implement beyond approved scope without asking.
- Do not leave completed tasks unchecked.
- Do not keep key decisions only in chat.
- Do not archive or sync specs during implementation unless the user explicitly wants that phase.
- Preserve unrelated user changes.

### Good Implementation Behavior

- small, reviewable deltas
- focused tests when they reduce regression risk
- direct alignment with tasks and specs
- honest reporting of blockers and mismatches

### Bad Implementation Behavior

- "I can probably skip tasks.md for now"
- "This spec is outdated, I'll just code what seems right"
- "While I'm here, I'll refactor these five adjacent modules"
- "The change is small, I don't need to update artifacts"

## Phase 5: Spec Sync

Use sync after implementation when approved delta specs must become canonical.

### Sync Goals

- merge approved change specs into `openspec/specs/**/spec.md`
- preserve meaning, scenarios, and constraints
- leave the canonical spec set clean and readable

### Sync Procedure

1. Confirm the implementation and intended behavior are aligned.
2. Identify the active change and all change spec files under `openspec/changes/<change-name>/specs/`.
3. Locate the corresponding canonical specs under `openspec/specs/`.
4. Parse the delta operations in each change spec.
5. Apply `ADDED Requirements`.
6. Apply `MODIFIED Requirements`.
7. Apply `REMOVED Requirements`.
8. Apply `RENAMED Requirements`.
9. Validate that the canonical spec now contains normal requirements only.
10. Remove duplication or contradiction without losing meaning.
11. Preserve important scenarios and wording precision.

### Delta Operation Rules

Treat each delta type intentionally:

- `ADDED`: create the new requirement in the canonical spec
- `MODIFIED`: update the matching existing requirement without dropping valid scenarios
- `REMOVED`: remove the requirement only when the removal is explicit and approved
- `RENAMED`: rename the requirement while preserving its intent and linked scenarios

If a `MODIFIED` or `REMOVED` requirement cannot be found, stop and ask instead of inventing behavior.

If a canonical spec does not exist, create it only when the delta clearly defines a new capability.

If two delta operations conflict, stop and ask for resolution.

Do not leave delta headers or delta-only structure in the canonical spec.

### Sync Guardrails

- Do not sync unapproved or incomplete behavior changes.
- Do not lose important scenarios while "cleaning up."
- Do not leave canonical specs contradicting implementation or delta specs.
- Do not silently drop requirements.
- Do not rewrite unrelated sections of canonical specs.

### Sync Output

When sync completes, report:

- the active change name
- the updated canonical spec paths
- how many requirements were added, modified, removed, or renamed
- the next recommended action

Use a concise structure equivalent to:

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

## Phase 6: Archive

Use archive only when the change is truly complete.

### Archive Preconditions

Before archive, confirm:

- implementation tasks are done or explicitly accepted
- canonical specs are updated if needed
- the change is not waiting on unresolved planning or sync work

### Archive Procedure

1. Confirm readiness.
2. Move the completed change into archive.
3. Preserve enough history for future traceability.
4. Report the final archived location.

### Archive Guardrails

- Do not archive a blocked or partial change.
- Do not archive before required spec sync.
- Do not throw away context needed for later understanding.

## Lightweight Host Adaptation

This skill can also perform a minimal adaptation role when the user asks to wire
OpenSpec into a host.

Typical outputs may include:

- `.trae/skills/`
- `.claude/skills/`
- `.trae/commands/openspec/`
- `.claude/commands/openspec/`
- `commands/`
- `mount-examples/`
- `MANIFEST.md`
- install scripts such as `install-to-trae.sh`

### Adaptation Procedure

1. Identify the target host and its supported file format.
2. Separate generic OpenSpec workflow content from host-specific wrapping.
3. Generate files in the directory layout the host expects.
4. Add frontmatter only when the host format requires it.
5. Preserve command names, trigger phrases, and parameter conventions.
6. Generate or update a manifest that maps source files to mounted files.
7. Include installation notes or scripts when the user wants reproducible setup.
8. Report generated files, assumptions, and any unofficial conventions used.

### Adaptation Decision Rules

- If the host format is known, follow that host's conventions.
- If the host format is unknown, generate plain Markdown prompt files and label them as examples.
- If parameter syntax is unknown, document placeholders instead of pretending support.
- Keep tool-specific formatting outside the core workflow text whenever possible.
- If the user wants a dry run or review-first mode, generate the mapping and assumptions before writing files.

When adapting:

- preserve host-specific user files when present
- prefer additive installation over replacement
- report exactly what was installed
- keep adapter output reproducible and documented

### Adaptation Guardrails

- Do not claim an unofficial format is official.
- Do not hard-code one host into generic workflow content.
- Do not remove source prompt files after generating mounted copies.
- Do not overwrite existing host commands without user approval.

### Adaptation Output

When adaptation completes, report:

- target host
- generated files
- assumptions
- next action

Use a concise structure equivalent to:

```text
OpenSpec tool adapter
Target host: <host>

Generated:
- <path>

Assumptions:
- <assumption>

Next action: <recommended next step>
```

If the full suite is installed, the detailed equivalent is `openspec-tool-adapter`.

## Common Failure Patterns

Watch for these mistakes:

- coding before proposal and tasks exist
- treating chat as the plan instead of writing files
- writing tasks that are too vague to resume later
- syncing canonical specs before the behavior is actually settled
- archiving because code landed even though specs are stale
- assuming readiness without reading the artifacts on disk

## Optional Detailed Skills

If the full suite is available, these sibling skills provide deeper, phase-specific workflows:

- `openspec-workflow-installer`
- `openspec-change-planning`
- `openspec-artifact-status`
- `openspec-change-implementation`
- `openspec-spec-sync`
- `openspec-archive`
- `openspec-tool-adapter`

Do not default to them. `mini-openspec` should remain sufficient when installed alone.

## Operating Mode

When using only `mini-openspec`:

- stay in this skill by default
- complete the relevant phase directly
- only escalate if the user explicitly asks or the extra specialization materially lowers risk

## Output Format

```text
Mini OpenSpec
Detected phase: <setup|planning|status|implementation|sync|archive|adapter>
Mode: <mini-only|escalate-to-detailed-skill>
Artifacts:
- <path>
Reason: <one sentence>
Next action: <what to do now>
```

## Example Outputs

### Planning

```text
Mini OpenSpec
Detected phase: planning
Mode: mini-only
Artifacts:
- openspec/changes/add-sso-login/proposal.md
- openspec/changes/add-sso-login/design.md
- openspec/changes/add-sso-login/tasks.md
- openspec/changes/add-sso-login/specs/auth/spec.md
Reason: the request changes non-trivial login behavior and needs durable planning before implementation
Next action: review the artifacts, then implement the first unchecked task
```

### Status

```text
Mini OpenSpec
Detected phase: status
Mode: mini-only
Artifacts:
- openspec/changes/add-sso-login/tasks.md
Reason: planning exists, but implementation cannot proceed until required tasks are clarified
Next action: update tasks.md to replace vague placeholders with executable checklist items
```

### Sync

```text
Using change: add-sso-login
Status: needs-spec-sync

Updated main specs:
- openspec/specs/auth/spec.md

Applied:
- Added: 1
- Modified: 2
- Removed: 0
- Renamed: 0

Next action: review the canonical auth spec, then proceed to archive if the change is otherwise complete
```

### Adapter

```text
OpenSpec tool adapter
Target host: Claude

Generated:
- .claude/skills/mini-openspec/SKILL.md
- .claude/commands/openspec/mini.md
- MANIFEST.md

Assumptions:
- Claude accepts frontmatter in mounted skill files
- command parameter placeholders should remain documented, not expanded

Next action: review the generated mapping, then install or mount the files into the target host
```