# Out-Skills Manifest

## Package

- Name: `gstack-out-skills`
- Version: `0.1.0`
- Description: Portable gstack-derived skill suite for Trae and Claude environments.
- Source root: `out-skills`
- Default install mode: `symlink`

## Default Targets

- Host: `trae`
  - Scope: `project`
  - Path: `.trae/skills`
- Host: `claude`
  - Scope: `global`
  - Path: `~/.claude/skills`

## Optional Targets

- Host: `claude`
  - Scope: `project`
  - Path: `.claude/skills`

## Skills

### `gstack-office-hours`

- Path: `gstack-office-hours/SKILL.md`
- Category: `framing`
- Summary: Reframes an idea into the real problem, user pain, and product wedge.
- Invoke when:
  - The user has an idea and needs product framing
  - The request is still fuzzy or exploratory
  - The user asks whether something is worth building

### `gstack-task-planner`

- Path: `gstack-task-planner/SKILL.md`
- Category: `planning`
- Summary: Turns a request into a bounded implementation plan.
- Invoke when:
  - The user asks for a plan before coding
  - The task is broad or multi-step
  - Execution steps need to be decomposed

### `gstack-engineering-workflow`

- Path: `gstack-engineering-workflow/SKILL.md`
- Category: `execution`
- Summary: Runs a software-delivery workflow from clarification to verified implementation.
- Invoke when:
  - The user wants a feature built or changed
  - The user wants a bug fixed safely
  - The task needs end-to-end engineering execution

### `gstack-task-reviewer`

- Path: `gstack-task-reviewer/SKILL.md`
- Category: `review`
- Summary: Reviews code changes for correctness, regression risk, and missing verification.
- Invoke when:
  - The user asks for code review
  - A diff or branch needs pre-merge review
  - A second opinion on code changes is needed

### `gstack-bug-investigator`

- Path: `gstack-bug-investigator/SKILL.md`
- Category: `debugging`
- Summary: Investigates bugs through reproduction, hypotheses, and evidence-backed root-cause analysis.
- Invoke when:
  - Behavior is broken and the cause is unclear
  - The user asks for debugging or root-cause analysis
  - Static reading alone is not enough to explain the failure
