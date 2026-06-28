# Mattpocock To Issues

Convert a destination into a journey: small vertical slices that can be picked up independently, verified on their own, and implemented with Mattpocock TDD.

## When To Use

Use when a PRD, plan, or settled conversation needs to become local Markdown issues that separate agents or sessions can implement independently.

## Inputs

Work from one of:

- the current conversation
- a PRD path
- a plan pasted by the user

If the source lives outside the repo, ask the user to provide the relevant text or an accessible exported document. Do not add source-specific workflow to this skill.

Write issues as local Markdown under `.scratch/<feature-slug>/issues/`.

## Vertical Slice Rule

Each issue must cut through the system end to end. Avoid horizontal tickets like "create database schema", "add API", or "build UI" unless the repo truly has no cross-layer work.

A good slice:

- demonstrates a narrow user-visible behavior
- includes the necessary persistence, interface, UI/API/CLI, and tests for that behavior
- can be reviewed without waiting for unrelated slices
- leaves the codebase deployable or at least verifiably green

## Process

### 1. Gather Context

Read the source plan or PRD. If it references a parent ticket, use the text the user provided. Read domain docs and relevant ADRs when present.

### 2. Find Prefactoring

Before slicing features, look for work that makes future slices easier:

- a shallow module that needs deepening first
- a missing seam needed for testing
- a duplicated integration path
- a domain term that needs clarification

Only create a prefactoring issue when it unlocks multiple later slices. Otherwise fold the cleanup into the first slice that needs it.

### 3. Draft Slices

For each slice, define:

- title
- behavior delivered
- acceptance criteria
- test seam
- dependencies or blockers
- user stories covered

Dependency order matters. Blockers should come first.

### 4. Review With The User

Present the proposed issue list before writing files. Ask one combined approval question:

```text
Does this granularity and dependency order look right, or should any slices be merged, split, or reordered?
```

Iterate until approved.

### 5. Write Issues

Use this issue body:

```md
# <Issue Title>

Status: ready-for-agent

## Parent

<PRD path, parent issue, or omitted if none>

## What To Build

Describe the end-to-end behavior, not layer-by-layer chores.

## Acceptance Criteria

- [ ] Observable criterion
- [ ] Test coverage criterion
- [ ] Integration criterion

## Test Seam

Name the module interface or user-visible seam tests should cross.

## Blocked By

None - can start immediately.
```

Write numbered local Markdown files:

```text
.scratch/<feature-slug>/issues/01-<slug>.md
.scratch/<feature-slug>/issues/02-<slug>.md
```

Do not close, rewrite, or relabel the parent PRD/ticket.

## Quality Bar

The final issue list should let separate agents work with minimal shared context. If two issues require constant coordination, they are not independent enough or the seam is wrong.
