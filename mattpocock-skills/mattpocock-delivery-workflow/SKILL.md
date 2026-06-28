# Mattpocock Delivery Workflow

Use this skill when the user is unsure which workflow step comes next. The package has one main path and one maintenance path.

## Main Path: Idea To Delivery

```text
rough idea
  -> Mattpocock Grill Me
  -> Mattpocock To PRD
  -> Mattpocock To Issues
  -> Mattpocock TDD per issue
```

### Start With Mattpocock Grill Me

Use when the idea still has open decisions. The output should be resolved decisions, assumptions, and a clear first slice.

### Move To Mattpocock To PRD

Use when the conversation is settled enough to preserve as a durable document. This creates the product contract and names the intended test seams.

### Move To Mattpocock To Issues

Use when the work is too large for one session or one implementation pass. This turns the PRD into vertical, independently grabbable issues.

### Implement With Mattpocock TDD

Use one issue per session when possible. Start fresh with the issue and PRD as context. Build one behavior at a time through red-green-refactor.

## Maintenance Path: Architecture Health

```text
codebase friction
  -> Mattpocock Improve Codebase Architecture
  -> pick candidate
  -> Mattpocock Grill Me interview loop
  -> optional PRD or issue slicing
```

Use Mattpocock Improve Codebase Architecture when tests are awkward, modules are shallow, behavior leaks across seams, or future agents keep needing too much context.

## Setup

The workflow runs without setup using local Markdown under `.scratch/`. If source material lives outside the repo, ask the user to paste it or provide an exported Markdown/text document.

## Context Hygiene

Keep grilling, PRD writing, and issue slicing in one continuous context when possible. After issues are published, implementation sessions can start fresh from the PRD and a single issue.

If the conversation is getting too large, create a handoff summary before moving phases.
