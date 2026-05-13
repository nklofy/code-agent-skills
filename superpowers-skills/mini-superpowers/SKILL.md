---
name: mini-superpowers
description: Compact standalone Superpowers workflow skill. Use when you want one lower-cost skill that can independently cover framing, planning, disciplined implementation, debugging, review, verification, and branch completion.
---

# Mini Superpowers

Use this as the standalone, low-cost version of the Superpowers workflow.

This skill is for the common case where the user installs only one skill from
this package and still wants strong engineering discipline.

It should be sufficient by itself for many real tasks:

- feature work that needs clarification and planning
- implementation that should stay scoped and verified
- bug fixing that must start from root-cause investigation
- review-oriented work that should prioritize correctness over style
- end-of-task handoff where evidence matters more than confidence

The sibling `superpowers-*` skills are optional upgrades, not prerequisites.
Mention them only when:

- the user explicitly asks for a specific sibling skill
- the host already has the full suite installed and deeper specialization materially reduces risk
- the task truly benefits from a dedicated workflow beyond this file

## What This Skill Replaces

`mini-superpowers` compresses the essential behavior of:

- `superpowers-using-superpowers`
- `superpowers-brainstorming`
- `superpowers-writing-plans`
- `superpowers-test-driven-development`
- `superpowers-systematic-debugging`
- `superpowers-executing-plans`
- `superpowers-subagent-driven-development`
- `superpowers-dispatching-parallel-agents`
- `superpowers-requesting-code-review`
- `superpowers-receiving-code-review`
- `superpowers-verification-before-completion`
- `superpowers-finishing-a-development-branch`
- `superpowers-using-git-worktrees`

Default assumption: stay in this one skill and do the work here.

## When To Invoke

Invoke when:

- you want one skill that can handle most engineering work end to end
- the host has limited context budget or skill-loading overhead
- you want Superpowers discipline without loading many separate skills
- the task needs framing, planning, implementation, debugging, review, verification, or clean completion

## When Not To Invoke

Do not use this skill as the primary workflow when:

- the user explicitly wants a named detailed sibling skill
- the task is purely administrative and contains no real engineering judgment
- the requested workflow conflicts with user instructions in project guidance

## Instruction Priority

Always resolve conflicts in this order:

1. user instructions and repository guidance
2. this skill
3. default habits or assumptions

If the user says not to use a specific workflow step, follow the user.

## Core Principles

- Think before coding.
- Present a design before implementing creative work.
- Plan before non-trivial implementation.
- Debug before fixing.
- Review before trusting.
- Verify before claiming success.
- Finish cleanly instead of abandoning loose ends.

## Hard Gates

These are non-negotiable unless the user explicitly overrides them.

### Design Gate

Do NOT implement, scaffold, or invoke implementation work for creative feature
work until you have:

1. explored enough project context
2. clarified the request
3. presented a design
4. received user approval for that design

This gate applies even to work that feels "simple." The design may be short, but
it must exist.

### Plan Gate

For any multi-step change, do NOT start coding until there is a concrete written
plan with:

- exact files or modules
- ordered tasks
- verification steps
- scope boundaries

### Debug Gate

Do NOT fix a bug before you have evidence-backed root-cause understanding.

### Verification Gate

Do NOT claim success without fresh verification evidence.

## Default File Outputs

When the user only installs `mini-superpowers`, this skill should still create
durable files rather than keeping the workflow only in chat.

Default locations:

- design/spec: `docs/superpowers/specs/YYYY-MM-DD-<topic>-design.md`
- implementation plan: `docs/superpowers/plans/YYYY-MM-DD-<feature-name>.md`

If the repository already has a preferred location, follow the repository.

## Quick Start

When this is the only installed skill:

1. detect the current phase
2. apply the relevant gate and workflow rules for that phase
3. emit the structured output and continue within this skill

## The Normal Paths

### Feature Work

1. Understand the request
2. Explore context
3. Propose approaches
4. Present and approve the design
5. Write the design doc
6. Write a plan
7. Implement in bounded steps
8. Review or self-review
9. Verify with evidence
10. Hand off or finish the branch

### Bug Work

1. Confirm the failure
2. Reproduce or gather hard evidence
3. Identify root cause
4. Implement the smallest fix
5. Verify the original symptom
6. Check for related regressions
7. Hand off honestly

## Phase 0: Determine What Kind Of Work This Is

Before taking action, classify the task:

- `brainstorm`: user goal or solution shape is still fuzzy
- `plan`: goal is known but steps are not
- `implement`: plan or task is ready to execute
- `debug`: something is broken and the cause is unclear
- `review`: change needs evaluation, not implementation
- `verify`: you are about to claim success
- `finish`: implementation is done and the work needs clean closure

Choose the phase from actual need, not from momentum.

## Phase 1: Understand And Frame

Use this phase when the request is new, ambiguous, or potentially over-scoped.

### Objectives

- restate what the user actually wants
- identify the real goal and constraints
- surface success criteria early
- detect when the ask is too large for one pass

### Framing Checklist

1. Read the most relevant files, docs, or context first.
2. Assess whether the request is too large for one spec or one plan.
3. Restate the request in concrete language.
4. Ask clarifying questions one at a time.
5. If useful, propose 2-3 approaches with trade-offs.
6. Prefer the narrowest slice that still delivers value.

### Key Brainstorming Rules

- Do not jump straight from vague idea to implementation.
- Even a "simple" feature should have a stated design, even if short.
- If the request really contains multiple projects, split it before planning.
- Present the design before coding and get explicit user approval.
- Write the approved design to disk before writing the implementation plan.
- Favor clarity over premature completeness.

### Brainstorming Procedure

1. Explore the current project state.
2. Ask clarifying questions one at a time.
3. Propose 2-3 approaches with trade-offs and a recommendation.
4. Present a design scaled to the task complexity.
5. Ask for user approval.
6. Save the approved design to `docs/superpowers/specs/...`.
7. Self-review the written design for placeholders, contradictions, ambiguity, and scope drift.
8. Ask the user to review the written design before moving to implementation planning.

The next step after approved brainstorming is implementation planning, not coding.
Do not skip directly from approved design to implementation.

### Design Contents

A good design usually covers:

- architecture or execution shape
- components or modules
- data flow
- error handling
- testing or verification approach
- boundaries and explicit non-goals

### Good Outcomes

- a crisp problem statement
- a recommended implementation direction
- clear boundaries for what is and is not included

## Phase 2: Plan Before Building

Use this phase for anything beyond a trivial change.

### Plan Requirements

A useful plan should include:

- the goal
- architecture summary
- tech stack or relevant tools
- the likely files or modules
- the step-by-step work breakdown
- known risks and assumptions
- the verification path

### Plan Storage

Save the plan to:

- `docs/superpowers/plans/YYYY-MM-DD-<feature-name>.md`

unless the repository already defines another location.

### Planning Rules

- steps should be independently executable
- steps should be small enough to verify
- steps should be ordered by dependency
- verification should be decided before editing
- exact file paths should be named whenever practical
- code-changing steps should include enough detail that another session could execute them reliably
- placeholders are plan failures, not acceptable drafts

### Plan Header Standard

Every substantial plan should begin with something equivalent to:

```markdown
# [Feature Name] Implementation Plan

**Goal:** [One sentence describing what this builds]

**Architecture:** [2-3 sentences about approach]

**Tech Stack:** [Key technologies/libraries]

---
```

### Task Granularity Standard

Prefer bite-sized steps that can be executed and verified independently.

Good step sequence:

1. write the failing test
2. run it to verify it fails
3. write the minimal implementation
4. run the focused test to verify it passes
5. commit or checkpoint

### No-Placeholder Rule

Never write plans like:

- `TBD`
- `TODO`
- `implement later`
- `add error handling`
- `write tests for this`
- `similar to task N`

If the plan is too vague to execute, the plan is not done yet.

### Plan Self-Review

After writing the plan, check:

1. spec coverage: does every requirement map to tasks?
2. placeholder scan: any vague steps left?
3. type/name consistency: do function names and interfaces stay consistent?
4. scope: is this still one coherent implementation plan?

### What A Good Plan Looks Like

- specific enough that another session could execute it
- scoped enough to avoid accidental expansion
- explicit enough to reveal uncertainty early
- durable enough to survive context loss

### What A Bad Plan Looks Like

- "update backend"
- "fix frontend"
- "clean things up"
- "run tests later"

### Execution Handoff

Once the plan is written, offer a clear execution choice:

- subagent-driven execution when fresh-task isolation and inter-task review help
- inline execution when the work is small enough to stay in one session

Do not blur planning and implementation into one unstructured stream.

Review cadence by mode:

- subagent-driven: review after each task
- inline execution: review after each meaningful batch

## Phase 3: Prepare The Workspace

Before risky implementation, decide whether isolation matters.

Ask:

- will this work interfere with current in-progress changes?
- is the repository already dirty?
- is the task risky enough to justify a worktree or isolated branch?

If isolation helps:

- prefer a clean branch or worktree
- avoid mixing unrelated edits
- keep the execution surface narrow

If you use a worktree:

- choose a location intentionally
- ensure project-local worktree directories are gitignored before use
- verify the new workspace starts from a clean baseline

Do not overcomplicate tiny changes, but do not ignore isolation when it clearly reduces risk.

## Phase 4: Implement With Discipline

Use this phase when the work is clear enough to execute.

### Implementation Checklist

1. Read relevant files before editing.
2. Confirm what success should look like.
3. Make the smallest correct change.
4. Keep the work aligned with the plan.
5. Verify each meaningful step.
6. Stop if the task reveals a planning contradiction.

### Implementation Rules

- do not drift into unrelated refactors
- preserve unrelated user changes
- match existing local patterns unless there is a strong reason not to
- keep changes reviewable and understandable
- stop and revisit design or plan if implementation contradicts them

### TDD Guidance

Prefer test-first or at least test-aware implementation when practical:

- if a focused failing test materially reduces regression risk, add it first
- for bug fixes, a reproduction or regression test is especially valuable
- if a proper automated test is not possible, define the strongest manual verification path before editing

Do not use "I'll verify later" as an excuse to skip discipline.

## Phase 5: Debug Before Fixing

Use this phase whenever behavior is broken and the cause is not already proven.

### Iron Rule

Do not propose or implement fixes before root-cause investigation.

### Debugging Procedure

1. Read the error or failure carefully.
2. Reproduce the issue if possible.
3. Check recent changes and likely boundaries.
4. Trace the actual execution path.
5. Form one concrete hypothesis at a time.
6. Test the hypothesis with the smallest useful check.
7. Only after evidence converges, implement the fix.

### Required Evidence Habits

- read full errors, not just the first line
- capture exact reproduction steps
- compare broken behavior with working references
- log or instrument component boundaries when the system is multi-layered
- reject hypotheses that do not fit the evidence

### Debugging Anti-Patterns

- "quick fix for now"
- "let's just try three changes"
- "it seems obvious"
- stacking speculative fixes without learning from failure

If three fix attempts have failed, stop and question the architecture or assumptions.

## Phase 6: Review With A Reviewer Mindset

Use this phase before merge, before handoff, or when the user asks for review.

### Review Priorities

Look for:

- correctness issues
- regressions
- unsafe assumptions
- missing validation
- missing tests or verification
- incomplete propagation of a changed field, flag, or mode

De-emphasize:

- cosmetic style preferences
- unrelated refactors
- vague theoretical comments with no evidence

### Review Procedure

1. Read the changed code or diff.
2. Read surrounding context needed to understand the behavior.
3. Do a high-risk pass first.
4. Do a secondary pass for tests, verification, and consistency.
5. Report findings in severity order.

### Severity Model

Use this severity model when reporting findings:

- `critical`: likely to break correctness, safety, or production behavior
- `high`: meaningful regression risk or major missing handling
- `medium`: non-trivial issue worth fixing before merge
- `low`: real but lower-impact issue

Do not inflate severity.

### When Review Is Mandatory

Treat review as mandatory:

- after completing a major feature
- before merge to the main branch
- after a complex bug fix

Treat review as strongly recommended:

- when stuck
- before a risky refactor
- after each meaningful batch in a longer execution flow

### Requesting Review

When the host supports it, review requests should include:

- what was implemented
- what plan or requirements it should satisfy
- the base SHA or prior checkpoint
- the current SHA or current state
- a concise description of the change

Fix critical issues immediately. Fix important issues before proceeding.

### Receiving Review

When feedback comes back:

- read all feedback before reacting
- restate unclear items in technical terms
- verify suggestions against the actual codebase
- separate real issues from noise
- do not defend weak code out of ego
- do not blindly accept wrong review comments either

### Forbidden Review Responses

Do not respond with performative agreement such as:

- "You're absolutely right!"
- "Great point!"
- "Excellent feedback!"

Instead:

- fix it and state what changed, or
- push back with technical reasoning, or
- ask for clarification before acting

If any review item is unclear, stop and clarify before implementing any of them.

Your goal is correctness, not agreement.

## Phase 7: Verify Before Claiming Success

Use this phase before any statement that implies the work is complete, fixed, or passing.

### Iron Rule

No completion claims without fresh verification evidence.

### Verification Gate

Before claiming anything positive:

1. identify the command or check that proves the claim
2. run it fresh
3. read the actual output
4. confirm the output supports the claim
5. only then state the result

### Verification Examples

- "tests pass" requires actual test output
- "build works" requires a real build or compile result
- "bug is fixed" requires the original symptom path to succeed
- "review is clean" requires actually doing the review

### Red Flags

Stop if you catch yourself saying:

- "should work now"
- "probably fixed"
- "looks good"
- "done" before verification

Confidence is not evidence.

## Phase 8: Finish Cleanly

Use this phase after the implementation and verification are done.

### Finish Checklist

- summarize what changed
- summarize how it was verified
- identify residual risks
- note any follow-up work
- choose the appropriate branch outcome: keep working, commit, open PR, merge, or clean up

### Finish Protocol

Before offering completion options:

1. run the relevant test or verification command
2. stop immediately if it fails
3. determine the likely base branch
4. present explicit next-step options

### Standard Completion Options

When the work is complete, the clean default options are:

1. merge back locally
2. push and create a pull request
3. keep the branch as-is for later
4. discard the work

If discard is chosen, require an explicit confirmation, not an inferred one.

Present exactly these four options in concise form. Do not replace them with an open-ended "what should I do next?" prompt.

If merge is chosen:

- verify the merged result again before treating the work as complete

If verification is still failing:

- do not offer merge or PR as ready outcomes yet

### Minimal PR Template

If the user chooses "push and create a pull request", a concise default PR body should include:

```markdown
## Summary
- <2-3 bullets of what changed>

## Test Plan
- [ ] <verification step>
```

### Completion Rules

- do not imply merge-readiness if major gaps remain
- do not hide uncertainty
- do not abandon a dirty branch without explaining state
- do not offer merge or PR when verification is still failing

## Common Rationalizations To Reject

- "this is too small to need planning"
- "this is too small to need a design"
- "this bug is obvious, I can skip investigation"
- "review is optional because the change is local"
- "I already know it passes"
- "I will verify after I tell the user"
- "while I'm here, I should refactor these other files"

These are workflow failures, not productivity.

## Optional Detailed Skills

If the full suite is available, these sibling skills provide deeper workflows:

- `superpowers-using-superpowers`
- `superpowers-brainstorming`
- `superpowers-writing-plans`
- `superpowers-test-driven-development`
- `superpowers-systematic-debugging`
- `superpowers-executing-plans`
- `superpowers-subagent-driven-development`
- `superpowers-dispatching-parallel-agents`
- `superpowers-requesting-code-review`
- `superpowers-receiving-code-review`
- `superpowers-verification-before-completion`
- `superpowers-finishing-a-development-branch`
- `superpowers-using-git-worktrees`

Do not default to them. `mini-superpowers` should remain useful when installed alone.

## Operating Mode

When using only `mini-superpowers`:

- continue within this one skill by default
- choose the current phase explicitly
- finish the needed workflow here unless escalation clearly earns its extra cost
- create design and plan documents on disk for non-trivial work
- treat review, verification, and finish as structured phases, not afterthoughts

Escalate only when:

- the user explicitly asks, or
- the extra specialization materially lowers risk more than it increases cost

## Output Format

```text
Mini Superpowers
Detected phase: <entry|brainstorm|plan|implement|debug|review|verify|finish|meta>
Mode: <mini-only|escalate-to-detailed-skill>
Focus: <what you are doing now>
Reason: <one sentence>
Next action: <what to do now>
```

## Example Outputs

### Planning

```text
Mini Superpowers
Detected phase: plan
Mode: mini-only
Focus: turn a multi-step request into an executable plan with verification steps
Reason: the change is broad enough that coding now would increase rework risk
Next action: produce a 4-step plan with scoped files, risks, and checks before editing
```

### Debugging

```text
Mini Superpowers
Detected phase: debug
Mode: mini-only
Focus: reproduce the flaky failure and test one root-cause hypothesis at a time
Reason: the issue is not yet understood well enough to justify any fix
Next action: capture a reliable reproduction path and compare the failing path with a known-good reference
```