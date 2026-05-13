---
name: "mini-gstack"
description: "Compact standalone gstack-derived workflow skill. Use when you want one lower-cost skill that can independently handle framing, planning, execution, review, and debugging."
---

# Mini GStack

Use this as the standalone, low-cost version of the gstack-derived workflow suite.

This skill is for the common case where the user installs only one skill from
this package and still wants a disciplined engineering method that stays:

- portable across hosts
- grounded in code and evidence
- scoped tightly enough to execute safely
- practical rather than ceremony-heavy

The sibling `gstack-*` skills are optional upgrades, not dependencies. Mention
them only when:

- the user explicitly asks for a named detailed skill
- the host already has the full suite installed and a dedicated phase workflow would materially help
- the task clearly benefits from more specialized framing, review, or debugging guidance

## What This Skill Replaces

`mini-gstack` compresses the essential behavior of:

- `gstack-office-hours`
- `gstack-task-planner`
- `gstack-engineering-workflow`
- `gstack-task-reviewer`
- `gstack-bug-investigator`

Default assumption: stay inside `mini-gstack` and complete the needed phase here.

## When To Invoke

Invoke when:

- the user asks for help and the task may involve framing, planning, execution, review, or debugging
- you want one skill that can cover the workflow at lower cost
- the host has limited context budget and a compact skill is preferable
- the request needs engineering judgment, not just raw editing

## When Not To Invoke

Do not use this skill as the primary workflow when:

- the user explicitly wants a named sibling skill
- the task is purely clerical and does not need engineering reasoning
- repository or user instructions require a different workflow

## Core Principles

- Find the real problem before proposing the solution.
- Keep scope bounded.
- Prefer the smallest correct change over the broadest possible one.
- Prefer evidence over intuition.
- Prefer explicit risks over silent optimism.
- Preserve unrelated work and local conventions.

## Operating Rules

- Prefer the strongest available source of truth.
- Adapt to the host's tools, but do not pretend missing evidence exists.
- Keep progress updates short and concrete.
- If the task turns out to be a different phase than expected, switch phases explicitly.

## Quick Start

When this is the only installed skill:

1. detect the current phase
2. apply that phase's workflow and evidence rules
3. emit the structured output and continue within this skill

## The Five Phases

This skill has five working phases:

1. framing
2. planning
3. execution
4. review
5. debugging

Not every task uses all five. Your first job is to identify which phase the task actually needs.

## Phase 0: Determine The Phase

Choose the current phase from the request:

- `framing`: the user goal or product direction is still fuzzy
- `planning`: the goal is known, but the work needs decomposition
- `execution`: the change is ready to implement
- `review`: code exists and should be evaluated
- `debugging`: behavior is broken and the cause is unclear

Common signals:

- "Should we build this?" -> framing
- "Make a plan first" -> planning
- "Implement this" -> execution
- "Review this diff" -> review
- "Why is this broken?" -> debugging

## Phase 1: Framing

Use this phase when the request still needs product or problem clarity.

### Objectives

- clarify what the user is really trying to solve
- identify the current pain or failure mode
- challenge shallow feature framing
- narrow to a realistic first wedge

### Framing Procedure

1. Restate the user's idea in simple terms.
2. Ask what problem exists today.
3. Ask who is affected and how often.
4. Identify the current workaround or cost of not fixing it.
5. Propose the narrowest useful first slice.

### Framing Rules

- do not jump to implementation before the real problem is clear
- prefer user pain over abstract opportunity
- prefer narrow wedges over broad platforms
- stop once the direction is clear enough to plan

### Good Framing Output

- problem statement
- target user or affected system area
- suggested first slice
- major assumptions

### Framing Output Contract

For framing-heavy tasks, end with:

- problem summary
- current pain or failure mode
- target user or system area
- recommended first slice
- major assumptions or unknowns

## Phase 2: Planning

Use this phase when the goal is clear enough to decompose but not yet ready to build safely.

### Objectives

- define scope
- identify likely files and boundaries
- break the work into executable steps
- define verification before coding starts

### Planning Procedure

1. Confirm the request and success criteria.
2. Gather only the planning context you need.
3. Split in-scope vs out-of-scope work.
4. Write a step-by-step plan.
5. List meaningful risks and unknowns.
6. Define the strongest likely verification path.

### Planning Rules

- do not over-investigate implementation details during planning
- prefer executable plans, not aspirational ones
- prefer smaller independently verifiable steps
- call out uncertainty early
- define the likely verification path before coding starts

### Good Plan Traits

- ordered by dependency
- realistic to execute
- scoped enough to avoid sprawl
- explicit about validation

### Planning Output Contract

For planning-heavy tasks, end with:

- scope
- in-scope vs out-of-scope notes
- ordered implementation steps
- risks or dependencies
- verification approach

## Phase 3: Execution

Use this phase when the task is ready to implement.

### Objectives

- understand before editing
- implement the smallest correct change
- verify with evidence
- hand off clearly

### Execution Procedure

1. Restate the task in concrete terms.
2. Read the relevant files and nearby context.
3. Form a compact execution plan.
4. Make the smallest correct change.
5. Verify using the strongest available evidence.
6. Summarize what changed and what remains risky.

### Execution Rules

- preserve unrelated user changes
- avoid broad rewrites unless necessary
- match local code style and conventions
- use focused tests when they materially reduce risk
- stop and ask if the task reveals conflicting user changes or ownership ambiguity
- hand off with residual risks and unverified assumptions made explicit

### Execution Anti-Patterns

- editing before understanding the real path
- changing many things "just in case"
- bundling unrelated refactors
- claiming success before verification

### Execution Output Contract

For execution-heavy tasks, end with:

- outcome
- main files changed
- verification performed
- residual risks or follow-ups

## Phase 4: Review

Use this phase when you need to evaluate changes rather than create them.

### Objectives

- find real bugs and regressions
- identify missing validation or tests
- surface risky assumptions
- report issues in priority order

### Review Procedure

1. Confirm what is under review.
2. Read the diff or changed files first.
3. Read enough surrounding context to understand behavior.
4. Do a high-risk pass for correctness.
5. Do a second pass for missing tests, validation, and consistency.
6. Report evidence-backed findings.

### Review Scope Order

Review the strongest available source in this order:

1. a user-provided diff or patch
2. the current branch diff against its base
3. the specific changed files named by the user
4. if none of the above exist, clarify what should be reviewed

If a diff is available, review the diff first, then read surrounding files as needed.

### Review Priorities

Look first for:

- incorrect logic
- missing null or boundary handling
- unsafe default behavior
- trust-boundary problems
- incomplete propagation of new fields or states
- missing coverage for important paths

De-emphasize:

- personal style preferences
- cosmetic suggestions
- unrelated refactors

### Severity Model

Use this severity model when reporting findings:

- `critical`: likely to break correctness, safety, or production behavior
- `high`: meaningful regression risk or major missing handling
- `medium`: non-trivial issue worth fixing before merge
- `low`: real but lower-impact issue

Do not inflate severity.

### Review Evidence Rules

Every finding should be backed by evidence.

When possible:

- cite the file and relevant symbol or code area
- explain the exact failure mode
- explain why the current implementation is unsafe or incomplete
- suggest the smallest reasonable fix direction

Do not claim:

- "this is probably covered"
- "this is likely handled elsewhere"
- "tests probably catch this"

unless you actually checked and can name the evidence.

### Review Output Contract

Default review structure:

1. findings, ordered by severity
2. open questions or assumptions
3. brief change summary

If no findings are discovered, say so explicitly and still note any residual risk or verification gap.

Do not lead with praise or summary before findings.

## Phase 5: Debugging

Use this phase when something is broken and the root cause is not yet proven.

### Objectives

- reproduce or gather evidence
- form concrete hypotheses
- test the hypotheses
- identify root cause before patching

### Debugging Procedure

1. Restate the failure in concrete terms.
2. Gather relevant files, logs, traces, and outputs.
3. Identify the likely execution path.
4. Reproduce the problem when possible.
5. Form a short list of plausible causes.
6. Test one hypothesis at a time.
7. Name the root cause clearly before fixing.

### Debugging Evidence Rules

Every conclusion should be tied to evidence.

When possible:

- cite the failing path, module, or boundary involved
- quote the observed mismatch between expected and actual behavior
- explain how the evidence supports the root cause
- distinguish observed facts from inferred conclusions

Do not claim:

- "this is probably the bug"
- "this should fix it"
- "it seems like"

unless you clearly label it as a hypothesis rather than a confirmed finding.

### Debugging Rules

- do not guess at root cause
- do not stack speculative fixes
- prefer narrowing the problem over changing many variables
- state uncertainty clearly when evidence is incomplete
- if reproduction is missing, downgrade confidence instead of pretending certainty
- if root cause is not strong enough, do not patch just to show progress

### Debugging Anti-Patterns

- "just try this fix"
- "it probably broke because of X"
- changing multiple layers before understanding the failure boundary

### Debugging Output Contract

For investigation-heavy tasks, end with:

- problem summary
- reproduction status
- root cause or leading hypothesis
- evidence
- fix status
- remaining risks or unknowns

If the issue is not fully resolved, say so directly.

## Cross-Phase Guardrails

- Do not start implementation when the request still needs framing.
- Do not skip planning for broad or multi-step work.
- Do not mix review with implementation unless the user explicitly wants both.
- Do not present guessed root causes as facts.
- Prefer this single-skill workflow when lower cost is more important than specialized depth.
- Do not claim verification you did not actually perform.

## Tooling Guidance

Adapt to the host's available tools.

If diff tools or version-control tools exist:

- use them to identify the real review or execution scope first

If file search and file read tools exist:

- use them before broad edits or broad claims

If diagnostics, tests, or command execution exist:

- use them as evidence, not decoration

If a tool does not exist in the current host:

- degrade gracefully and state what could not be verified

## Typical Flows

### Idea To Build

`framing` -> `planning` -> `execution`

### Bug To Fix

`debugging` -> `execution`

### Build To Review

`execution` -> `review`

### Review Then Revise

`review` -> `execution` -> `review`

## Common Mistakes To Avoid

- solving the proposed solution instead of the actual problem
- writing a plan that is too vague to execute
- over-reading the codebase when a smaller context is enough
- implementing before deciding how the result will be verified
- reviewing style while missing correctness issues
- patching bugs before the failure is understood

## Optional Detailed Skills

If the full suite is available, these sibling skills provide deeper phase-specific guidance:

- `gstack-office-hours` for framing
- `gstack-task-planner` for planning
- `gstack-engineering-workflow` for execution
- `gstack-task-reviewer` for review
- `gstack-bug-investigator` for debugging

Do not default to them. `mini-gstack` should remain useful when installed alone.

## Operating Mode

When using only `mini-gstack`:

- stay within this one skill by default
- choose the current phase explicitly
- complete the needed work here unless escalation clearly earns its cost

Escalate only when:

- the user explicitly asks, or
- the task benefits enough from specialization to justify extra context cost

## Output Format

```text
Mini GStack
Detected phase: <framing|planning|execution|review|debugging>
Mode: <mini-only|escalate-to-detailed-skill>
Focus: <what you are doing now>
Reason: <one sentence>
Next action: <what to do now>
```

## Example Outputs

### Framing

```text
Mini GStack
Detected phase: framing
Mode: mini-only
Focus: clarify the real user problem and narrow the first viable wedge
Reason: the request describes a solution shape, but the underlying pain and scope are still unclear
Next action: ask one high-signal clarifying question about the current workaround and who is affected
```

### Planning

```text
Mini GStack
Detected phase: planning
Mode: mini-only
Focus: decompose the request into a bounded implementation plan with clear verification
Reason: the goal is clear enough to scope, but coding now would increase coordination and regression risk
Next action: produce an ordered plan with in-scope boundaries, likely files, and verification steps
```

### Execution

```text
Mini GStack
Detected phase: execution
Mode: mini-only
Focus: implement the smallest correct change and verify it with the strongest available evidence
Reason: the task is ready to build and the remaining uncertainty is low enough to execute safely
Next action: read the relevant files, make the scoped change, and run focused verification before handoff
```

### Review

```text
Mini GStack
Detected phase: review
Mode: mini-only
Focus: inspect changed code for correctness issues, regressions, and missing validation
Reason: the task is to evaluate an existing change rather than implement a new one
Next action: review the diff first, then read surrounding code needed to verify the changed behavior
```

### Debugging

```text
Mini GStack
Detected phase: debugging
Mode: mini-only
Focus: reproduce the failure, test one concrete hypothesis, and separate confirmed facts from inference
Reason: the behavior is broken, but the root cause is not yet proven strongly enough to justify a fix
Next action: capture a minimal reproduction path and identify the first boundary where expected and actual behavior diverge
```