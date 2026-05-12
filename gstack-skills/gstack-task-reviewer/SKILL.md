---
name: "gstack-task-reviewer"
description: "Reviews code changes for correctness, regression risk, and missing validation. Invoke when the user asks for code review, diff review, pre-merge review, or a second opinion on changes."
---

# GStack Task Reviewer

Use this skill as a portable code-review workflow for coding agents.

This skill is designed for general agent environments. It does not assume a
specific Git host, PR system, browser runtime, or repository convention.

Its job is to review code changes with a strong engineering focus:

- Find real bugs and behavioral regressions
- Identify risky assumptions and missing validation
- Surface missing tests or verification gaps
- Distinguish high-severity issues from minor observations
- Prefer evidence-backed findings over generic style commentary

## Purpose

This skill helps an agent review code changes with a strong engineering focus:

1. Confirm the review scope
2. Read the changed code and nearby context
3. Find correctness and regression risks
4. Check for missing validation and missing tests
5. Report findings in severity order
6. Hand off a clear, evidence-backed review

## When To Invoke

Invoke this skill when:

- The user asks for a code review
- The user asks to review a diff or branch
- The user wants a pre-merge or pre-ship check
- The user asks for a second opinion on a change
- The user asks whether a code change is safe

Do not invoke this skill when:

- The user only wants implementation, not review
- There are no code changes to inspect
- The task is purely explanatory with no code under review

## Operating Principles

Default to a reviewer mindset, not an implementer mindset.

Your primary goal is to find:

- Bugs
- Regressions
- Correctness issues
- Missing edge-case handling
- Missing validation or trust boundaries
- Missing or insufficient verification

De-emphasize:

- Personal style preferences
- Cosmetic formatting comments
- Refactors that are unrelated to the reviewed change
- Hypothetical issues without evidence

## Inputs To Review

Review the strongest available source of truth in this order:

1. A user-provided diff or patch
2. The current branch diff against its base
3. The specific changed files named by the user
4. If none of the above exist, ask the user what should be reviewed

If a Git diff is available, prefer reviewing the diff first, then read
surrounding files as needed for context.

## Workflow

### 0. Confirm Review Scope

Determine what exactly is being reviewed:

- Current branch against base
- A set of modified files
- A pasted diff
- A specific commit or patch

If the scope is unclear, ask one concise question before proceeding.

### 1. Gather Context

Before producing findings:

- Read the changed code carefully
- Read nearby code needed to understand control flow and assumptions
- Identify the feature area, data flow, and failure path
- Look for existing tests that should cover the modified behavior

Do not review only filenames or commit messages. Review the actual code.

### 2. Run A Two-Pass Review

#### Pass 1: High-Risk Findings

Look first for issues that could break behavior in production:

- Incorrect logic or state transitions
- Missing null, error, or boundary handling
- Race conditions or ordering hazards
- Unsafe trust of generated, remote, or user-provided data
- Missing input validation or output validation
- Query or storage mistakes
- Unsafe shell, path, or command construction
- Incorrect enum, status, or mode handling
- Silent fallthrough to wrong defaults

#### Pass 2: Secondary Findings

Then look for lower-severity but meaningful issues:

- Missing tests for an important new path
- Verification gaps
- Performance problems introduced by the change
- Incomplete propagation of a new field, flag, or type
- Inconsistent handling across related modules
- Documentation or config mismatches caused by the change

## Severity Model

Use this severity model in findings:

- `critical`: likely to break correctness, safety, or production behavior
- `high`: meaningful regression risk or major missing handling
- `medium`: non-trivial issue worth fixing before merge
- `low`: real but lower-impact issue

Do not inflate severity.

If an issue is uncertain, either verify it or clearly label the uncertainty.

## Evidence Rules

Every finding should be backed by evidence.

When possible:

- Cite the file and relevant symbol or code area
- Explain the exact failure mode
- Explain why the current implementation is unsafe or incomplete
- Suggest the smallest reasonable fix direction

Do not claim:

- "this is probably covered"
- "this is likely handled elsewhere"
- "tests probably catch this"

unless you actually checked and can name the evidence.

## Tooling Guidance

Adapt to the current host's tools.

If diff tools or version-control tools exist:

- Use them to identify the actual review scope before reading files broadly

If file search and file read tools exist:

- Use them to read the changed code and the nearby context needed to verify risk

If diagnostics, tests, or build commands exist:

- Use them as evidence when confirming or rejecting a suspected finding

If a tool does not exist in the current host:

- Degrade gracefully and state what could not be verified

## Output Contract

Present findings first, ordered by severity.

Recommended structure:

1. Findings
2. Open questions or assumptions
3. Brief change summary

If no findings are discovered, say so explicitly and still mention any residual
risk or verification gap.

## Anti-Patterns

Do not:

- Praise the change before checking for issues
- Lead with summaries instead of findings
- Report style-only nits as major findings
- Recommend large rewrites when a local fix is enough
- Review only the diff header without reading surrounding code
- Invent risks you cannot explain concretely

## Example Invocation Scenarios

- "Review this diff before I merge"
- "Can you code review these changes?"
- "Find bugs or regressions in this branch"
- "Give me a second opinion on this patch"
- "Do a pre-ship review"

