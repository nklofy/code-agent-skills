# OpenSpec Skills Rebuild Plan

## Goal

Rebuild the OpenSpec project capabilities as seven portable agent skills.

All generated skills use the `openspec-` prefix and live under:

```text
out-skills/
```

Each skill has this structure:

```text
out-skills/<skill-name>/SKILL.md
```

## Planned Skills

1. `openspec-workflow-installer`
2. `openspec-change-planning`
3. `openspec-artifact-status`
4. `openspec-change-implementation`
5. `openspec-spec-sync`
6. `openspec-archive`
7. `openspec-tool-adapter`

## Directory Layout

```text
out-skills/
├── PLAN.md
├── openspec-workflow-installer/
│   └── SKILL.md
├── openspec-change-planning/
│   └── SKILL.md
├── openspec-artifact-status/
│   └── SKILL.md
├── openspec-change-implementation/
│   └── SKILL.md
├── openspec-spec-sync/
│   └── SKILL.md
├── openspec-archive/
│   └── SKILL.md
└── openspec-tool-adapter/
    └── SKILL.md
```

## Skill Responsibilities

### openspec-workflow-installer

Installs or updates OpenSpec workflow files in a target project.

Responsibilities:

- Create the `openspec/` base structure
- Create or update `openspec/config.yaml`
- Install or refresh agent skills and command prompts
- Detect target agent tooling
- Avoid overwriting existing user-authored workflow files

### openspec-change-planning

Turns a user request into a scoped OpenSpec change.

Responsibilities:

- Create `openspec/changes/<change-name>/`
- Create or update `proposal.md`
- Create or update `design.md`
- Create or update `tasks.md`
- Create or update change-level delta specs
- Clarify scope, non-goals, impact, and acceptance criteria

### openspec-artifact-status

Determines current change state and recommends the next action.

Responsibilities:

- Identify the active change
- Inspect proposal, design, tasks, and specs
- Classify artifacts as `missing`, `draft`, `ready`, `stale`, or `done`
- Classify the change lifecycle state
- Report blockers and next action

### openspec-change-implementation

Implements a planned OpenSpec change.

Responsibilities:

- Read proposal, design, tasks, and specs before coding
- Implement the next unchecked task
- Update `tasks.md` after progress
- Stop when implementation contradicts specs or design
- Keep code changes scoped to the approved plan

### openspec-spec-sync

Applies approved delta specs into canonical main specs.

Responsibilities:

- Read `openspec/changes/<change>/specs/*/spec.md`
- Apply `ADDED`, `MODIFIED`, `REMOVED`, and `RENAMED` requirement sections
- Update `openspec/specs/<capability>/spec.md`
- Ensure main specs do not contain delta headers
- Validate requirement and scenario structure

### openspec-archive

Safely archives a completed OpenSpec change.

Responsibilities:

- Check task completion
- Check whether spec sync is required
- Prevent unsafe archive operations
- Move the change into `openspec/changes/archive/YYYY-MM-DD-<change-name>/`
- Report final archive state

### openspec-tool-adapter

Adapts OpenSpec workflows to specific agent hosts.

Responsibilities:

- Generate host-specific skill or command prompt files
- Produce mount documentation
- Support Trae, Claude, and custom markdown-command hosts
- Keep workflow content separate from host-specific formatting
- Preserve trigger phrases and parameter conventions

## Dependency Flow

```text
openspec-workflow-installer
        |
        v
openspec-change-planning
        |
        v
openspec-artifact-status
        |
        +--> openspec-change-implementation
        |           |
        |           v
        |    openspec-spec-sync
        |           |
        |           v
        |    openspec-archive
        |
        v
openspec-tool-adapter
```

## Shared SKILL.md Structure

Each skill uses this structure:

```markdown
---
name: "openspec-..."
description: "..."
---

# Skill Title

## Purpose

## When To Invoke

## Inputs

## Repository Files

## Procedure

## Decision Rules

## Guardrails

## Output Format

## Examples
```

## Implementation Order

1. Write this plan to `out-skills/PLAN.md`
2. Create `openspec-workflow-installer`
3. Create `openspec-change-planning`
4. Create `openspec-artifact-status`
5. Create `openspec-change-implementation`
6. Create `openspec-spec-sync`
7. Create `openspec-archive`
8. Create `openspec-tool-adapter`
9. Review all frontmatter, trigger conditions, and boundaries

## Boundary Rules

- `openspec-workflow-installer` initializes or updates workflow assets only.
- `openspec-change-planning` plans changes but does not implement code.
- `openspec-artifact-status` reports state but does not perform broad edits.
- `openspec-change-implementation` edits code only after reading approved artifacts.
- `openspec-spec-sync` updates canonical specs but does not archive changes.
- `openspec-archive` archives changes but does not implement feature work.
- `openspec-tool-adapter` generates host-specific mounting assets only.
