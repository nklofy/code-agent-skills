# Mattpocock To PRD

Synthesize the conversation into a product requirements document. Do not re-interview the user unless a missing decision would make the PRD misleading. Prefer synthesis over discovery.

## When To Use

Use after an idea has enough resolved decisions to become a durable local Markdown PRD.

## Preconditions

Write the PRD as local Markdown:

```text
.scratch/<feature-slug>/PRD.md
```

Read `CONTEXT.md`, `CONTEXT-MAP.md`, and relevant ADRs when present. Proceed silently when they are absent.

## Process

### 1. Reconstruct The Decision Thread

Extract from the current conversation:

- problem from the user's perspective
- proposed solution
- actors and user stories
- explicit decisions
- unresolved assumptions
- out-of-scope items

Use domain glossary terms when they exist. Do not invent implementation vocabulary when a domain term is available.

### 2. Identify Test Seams

Before writing the PRD, name the seams where the future implementation should be tested.

Use `mattpocock-codebase-design` language:

- Which module interface should tests cross?
- Is the seam existing or new?
- What behavior should sit behind the interface?
- Which dependencies are in-process, local-substitutable, owned remote, or true external?

Prefer one high seam over many low seams. If multiple seams are unavoidable, explain why.

If this seam choice is uncertain, ask the user one confirmation question before publishing.

### 3. Write The PRD

Use this structure:

```md
# <Feature Name>

Status: ready-for-agent

## Problem Statement

Describe the user's problem in product language.

## Solution

Describe the intended user-facing outcome.

## User Stories

1. As a <actor>, I want <capability>, so that <benefit>.

## Implementation Decisions

- Durable decisions about modules, interfaces, data shape, integrations, and behavior.
- Avoid file paths and code snippets unless a compact prototype artifact expresses the decision more precisely than prose.

## Testing Decisions

- Public interface or seam to test through.
- Observable behaviors to verify.
- Existing test patterns to follow.
- Boundaries that may be mocked or substituted.

## Out Of Scope

- Explicit exclusions.

## Assumptions And Open Questions

- Assumptions that can survive into implementation.
- Questions that must be resolved before implementation, if any.
```

## Output

Write the PRD locally:

1. Create `.scratch/<feature-slug>/`.
2. Write `.scratch/<feature-slug>/PRD.md`.
3. Include `Status: ready-for-agent` near the top.

Do not create implementation issues here. Use Mattpocock To Issues after the PRD is accepted.

## Completion

Report the PRD location and summarize:

- chosen test seam
- number of user stories
- unresolved assumptions, if any
