---
name: "gstack-engineering-workflow"
description: "Runs a general software-delivery workflow from clarification to verification. Invoke when the user asks to build, change, fix, or safely complete an engineering task."
---

# GStack Engineering Workflow

Use this skill as a general-purpose delivery workflow for coding agents.

This skill is designed to be portable across agent hosts. It does not assume a
specific runtime, slash-command system, or browser stack. Adapt the workflow to
the tools available in the current environment.

Its job is to move from a user request to a verified engineering outcome:

- Clarify the request
- Read the relevant code and constraints
- Make a compact plan
- Implement the smallest correct change
- Verify with the strongest available evidence
- Hand off clearly with risks and gaps called out

## Purpose

This skill helps an agent move from a user request to a verified implementation
without skipping important engineering steps:

1. Clarify the request
2. Inspect the codebase and constraints
3. Make a plan
4. Implement the smallest correct change
5. Verify the result
6. Hand off clearly

## When To Invoke

Invoke this skill when:

- The user asks to build or change a feature
- The user asks to fix a bug
- The user asks for a structured implementation workflow
- The request is large enough that planning and verification matter
- The agent should act like an end-to-end engineer, not just write code

Do not invoke this skill when:

- The task is pure explanation with no implementation intent
- The task is a pure review task
- The task is a pure debugging investigation
- The task only needs planning and should stop before coding

## Operating Principles

- Prefer understanding before editing
- Prefer the smallest correct change over broad rewrites
- Prefer evidence over assumptions
- Prefer explicit risks and open questions over silent guessing
- Keep user-facing progress updates short and concrete
- Avoid unrelated refactors during scoped tasks

## Workflow

### 0. Confirm Intent

Restate the request in one or two sentences.

If the request is ambiguous, ask only the minimum clarifying questions needed to
avoid building the wrong thing.

If the request is clear, do not block on unnecessary questions.

### 1. Gather Context

Inspect the relevant project context before editing:

- Read the files most likely to contain the feature or bug
- Check related configuration, tests, and docs when they affect behavior
- Identify the actual execution path, not just filenames that look relevant

Build a short mental model of:

- Entry points
- Important modules
- Data flow
- Existing conventions
- Likely verification path

### 2. Make A Small Plan

Before editing, produce a compact plan.

For small tasks, keep the plan to 2-4 steps.

For larger tasks, include:

- Scope of change
- Files or modules likely to change
- Verification approach
- Risks or assumptions

If the task is multi-step, update the user as you move through the plan.

### 3. Implement Carefully

When making changes:

- Edit only the files needed for the task
- Match existing code style and local conventions
- Preserve unrelated user changes
- Do not rename or reorganize code unless it is necessary
- Add comments only where they materially improve readability

If you find unexpected conflicting changes or unclear ownership boundaries, stop
and ask the user how to proceed.

### 4. Verify With Evidence

After implementation, verify using the strongest available evidence.

Prefer, in order:

1. Focused automated tests near the change
2. Typecheck, linter, or diagnostics
3. Build or compile checks
4. Runtime or manual verification

If browser or UI tooling is available, use it when the task affects real user
flows. If not available, state the gap clearly instead of pretending the flow
was tested.

If verification fails, fix the issue before handoff when practical.

### 5. Review The Change

Before handoff, perform a quick self-review:

- Does the change solve the requested problem?
- Did the scope stay tight?
- Did you preserve existing behavior where required?
- Did you add or update tests only when they add real value?
- Are there any residual risks, edge cases, or unverified assumptions?

### 6. Hand Off Clearly

In the final response:

- State what changed
- Reference the main files touched
- Summarize how it was verified
- Call out any limitations, follow-ups, or things not verified

Do not bury risks or testing gaps.

## Tooling Guidance

Adapt to the current host's tools.

If file search and file read tools exist:

- Use them before broad edits

If patch or edit tools exist:

- Prefer precise edits over rewriting entire files

If diagnostics exist:

- Run diagnostics on changed files after substantive edits

If test or command execution exists:

- Use it to verify behavior, not just to produce output

If browser automation exists:

- Use it for UI-critical flows, screenshots, reproduction, and regression checks

If a tool does not exist in the current host:

- Degrade gracefully and state what could not be verified

## Output Contract

Structure outputs proportionally to the task size.

For implementation tasks, the final answer should usually include:

- Outcome
- Files changed
- Verification
- Risks or follow-ups

For larger tasks, also include:

- Short implementation approach
- Any assumptions made

## Anti-Patterns

Do not:

- Jump straight into editing without reading context
- Make speculative changes outside the requested scope
- Claim verification you did not actually perform
- Add low-value tests that only restate the implementation
- Hide uncertainty when requirements are incomplete
- Rewrite architecture when a local fix is enough

## Example Invocation Scenarios

- "Implement this feature end to end"
- "Fix this bug and make sure it is verified"
- "Update this module safely"
- "Make the change and run the right checks"
- "Handle this as a normal engineering task, not just a code snippet"

