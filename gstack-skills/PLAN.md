# Out-Skills Plan

## Goal

Recreate a compact, portable set of 5 `gstack-` prefixed skills derived from
the broader `gstack` methodology.

These skills will live under `out-skills/` and be designed for reuse in a
general agent environment without depending on the full `gstack` runtime.

## Target Skills

1. `gstack-office-hours`
2. `gstack-task-planner`
3. `gstack-engineering-workflow`
4. `gstack-task-reviewer`
5. `gstack-bug-investigator`

## Scope

This effort includes:

- Creating one directory per skill under `out-skills/`
- Writing one portable `SKILL.md` per skill
- Writing a suite-level `README.md`
- Keeping naming, tone, and structure consistent across all skills

This effort does not include:

- Reproducing the full `gstack` runtime
- Recreating browser daemon features
- Recreating host-specific wrappers
- Recreating telemetry, memory, or upgrade behavior

## Design Rules

All generated skills should follow these rules:

- Names use the `gstack-` prefix
- Frontmatter is in English
- Descriptions say both what the skill does and when to invoke it
- Content is portable across agent hosts
- The skill stops at its own responsibility boundary
- Tool references degrade gracefully when tools are unavailable

## Shared Document Shape

Each `SKILL.md` should use a similar structure:

- Purpose
- When To Invoke
- Operating Principles
- Workflow
- Tooling Guidance
- Output Contract
- Anti-Patterns
- Example Invocation Scenarios

## Skill Intent

### `gstack-office-hours`

Purpose:

- Reframe a user's request into the real problem, goal, and product wedge

Boundary:

- Stops after problem clarification and direction-setting
- Does not proceed into implementation planning by default

### `gstack-task-planner`

Purpose:

- Break a scoped request into an actionable implementation plan

Boundary:

- Stops at plan output
- Does not proceed into coding unless explicitly asked

### `gstack-engineering-workflow`

Purpose:

- Execute a software task from clarification through implementation and
  verification

Boundary:

- Acts as the main build path
- Does not replace dedicated review or debugging skills when those are the
  user's primary need

### `gstack-task-reviewer`

Purpose:

- Review code changes for correctness, regression risk, and verification gaps

Boundary:

- Review-first
- Findings come before summaries or fixes

### `gstack-bug-investigator`

Purpose:

- Investigate a failure through reproduction, hypotheses, and evidence

Boundary:

- Root-cause first
- Does not encourage speculative fixes

## Planned Output Layout

```text
out-skills/
├── PLAN.md
├── README.md
├── gstack-office-hours/
│   └── SKILL.md
├── gstack-task-planner/
│   └── SKILL.md
├── gstack-engineering-workflow/
│   └── SKILL.md
├── gstack-task-reviewer/
│   └── SKILL.md
└── gstack-bug-investigator/
    └── SKILL.md
```

## Execution Phases

### Phase 1

- Write `PLAN.md`
- Write suite-level `README.md`

### Phase 2

- Implement the first 3 skills:
  - `gstack-office-hours`
  - `gstack-task-planner`
  - `gstack-engineering-workflow`

### Phase 3

- Implement the remaining 2 skills:
  - `gstack-task-reviewer`
  - `gstack-bug-investigator`

### Phase 4

- Review for naming consistency
- Review for style consistency
- Validate structure and diagnostics

## Review Workflow

The implementation should proceed incrementally:

1. Confirm plan
2. Persist plan
3. Create suite README
4. Build skills in batches
5. Validate after each batch

## Success Criteria

The work is successful when:

- All 5 skills exist under `out-skills/`
- All 5 use consistent frontmatter and structure
- The suite README explains routing and boundaries
- The resulting package is portable and understandable without reading the full
  `gstack` repo

