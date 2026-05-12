---
name: "gstack-bug-investigator"
description: "Investigates bugs using reproduction, hypotheses, evidence, and validation. Invoke when the user asks to debug a problem, find root cause, or explain failing behavior."
---

# GStack Bug Investigator

Use this skill as a portable debugging and root-cause-analysis workflow for
coding agents.

This skill is designed for general agent environments. It does not assume a
specific debugger, browser stack, runtime, or hosting platform. Adapt the
workflow to the tools available in the current environment.

Its job is to investigate a problem before proposing a fix:

- Reproduce the issue when possible
- Build and test hypotheses
- Trace the real execution path
- Isolate the root cause
- Avoid blind fix attempts
- Verify the actual resolution

## Purpose

This skill helps an agent debug issues with a disciplined engineering process:

1. Confirm the bug report and impact
2. Gather context and reproduction details
3. Form concrete hypotheses
4. Collect evidence to validate or reject each hypothesis
5. Identify the most likely root cause
6. Verify the fix or document the remaining uncertainty

## When To Invoke

Invoke this skill when:

- The user reports a bug or broken behavior
- The user asks to debug an issue
- The user asks for root-cause analysis
- The system behaves unexpectedly and the cause is unclear
- Static inspection alone is not enough to explain the failure

Do not invoke this skill when:

- The user only wants a code review with no active bug
- The task is purely feature implementation
- The failure is already fully understood and only a small mechanical fix remains

## Operating Principles

- Prefer investigation before modification
- Prefer one tested hypothesis at a time
- Prefer reproducible evidence over intuition
- Prefer narrowing the problem over changing many things at once
- State uncertainty explicitly when the evidence is incomplete
- Do not present guessed root causes as facts

## Workflow

### 0. Confirm The Problem

Restate the reported issue in concrete terms:

- What is failing
- What was expected instead
- Where it happens
- How severe or blocking it is

If the report is vague, ask only the minimum questions needed to investigate.

### 1. Gather Context

Before changing code:

- Read the relevant files
- Identify the entry point and execution path
- Check logs, errors, stack traces, or failing outputs if available
- Identify what changed recently if change history is available
- Note environment-specific factors such as config, runtime, platform, or auth

Build a small mental model of:

- Inputs
- State transitions
- Side effects
- Error boundaries
- Observability points

### 2. Reproduce The Issue

Try to reproduce the problem as directly as possible.

If reproduction is possible:

- Record the exact triggering steps
- Capture the observed failure
- Keep the reproduction path minimal

If reproduction is not possible:

- Explain why
- Use the strongest indirect evidence available
- Avoid claiming certainty

### 3. Form Hypotheses

Generate a short list of plausible explanations.

Each hypothesis should be specific enough to test, for example:

- A null value reaches a path that assumes presence
- A status transition skips validation
- A race condition allows stale state to win
- A config mismatch routes execution to the wrong branch

Do not generate a long speculative list. Focus on the most likely causes.

### 4. Test Hypotheses

For each hypothesis:

- Identify what evidence would support it
- Identify what evidence would falsify it
- Run the smallest useful check

Examples of useful checks:

- Read adjacent code paths
- Search all consumers of a changed value or flag
- Run a focused test
- Add temporary instrumentation if allowed
- Compare expected and actual state at a boundary

Reject weak hypotheses quickly when evidence contradicts them.

### 5. Identify Root Cause

Once the evidence converges:

- Name the root cause clearly
- Explain the triggering condition
- Explain why the system behaved the way it did
- Explain why nearby explanations were ruled out

If the evidence is still partial, state the leading hypothesis and the gap that
prevents full confirmation.

### 6. Fix And Validate

If the user wants a fix and the root cause is sufficiently understood:

- Apply the smallest reasonable fix
- Verify the original reproduction path
- Verify that the fix does not obviously break related behavior

If the user wants investigation only:

- Do not make code changes

If the root cause is not yet strong enough:

- Do not patch speculatively just to make progress look faster

## Evidence Rules

Every conclusion should be tied to evidence.

When possible:

- Cite the failing path, module, or boundary involved
- Quote the observed mismatch between expected and actual behavior
- Explain how the evidence supports the root cause
- Distinguish observed facts from inferred conclusions

Do not claim:

- "this is probably the bug"
- "this should fix it"
- "it seems like"

unless you clearly label it as a hypothesis rather than a confirmed finding.

## Tooling Guidance

Adapt to the current host's tools.

If logs, diagnostics, or stack traces exist:

- Use them early to narrow the search space

If file search and file read tools exist:

- Use them to trace the execution path and related consumers

If tests or command execution exist:

- Use focused reproduction and verification steps instead of broad reruns only

If runtime instrumentation is possible:

- Add the smallest temporary instrumentation needed to test a hypothesis

If a tool does not exist in the current host:

- Degrade gracefully and explain what evidence could not be collected

## Output Contract

For investigation tasks, the final answer should usually include:

- Problem summary
- Reproduction status
- Root cause or leading hypothesis
- Evidence
- Fix status
- Remaining risks or unknowns

If the issue is not fully resolved, say so directly.

## Anti-Patterns

Do not:

- Start patching before understanding the failure
- Try multiple unrelated fixes at once
- Treat every symptom as a separate root cause
- Hide failed hypotheses
- Claim certainty when reproduction is missing
- Confuse correlation with causation

## Example Invocation Scenarios

- "Debug why this endpoint is failing"
- "Find the root cause of this regression"
- "Investigate this flaky behavior"
- "Why is this flow broken in production?"
- "Do root-cause analysis before fixing it"

