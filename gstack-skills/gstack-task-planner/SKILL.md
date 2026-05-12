---
name: "gstack-task-planner"
description: "Breaks down requirements into an actionable implementation plan. Invoke when the user asks to plan work, decompose a task, or define execution steps before coding."
---

# GStack Task Planner

Use this skill as a portable planning workflow for coding agents.

This skill is designed for general agent environments. It does not assume a
specific project-management tool, planning system, or host runtime. Adapt the
workflow to the tools available in the current environment.

Its job is to turn an ambiguous or broad request into a concrete plan:

- Clarify the real goal
- Identify scope and constraints
- Break the work into executable pieces
- Surface assumptions and risks early
- Define a verification strategy before implementation
- Stop at the planning stage unless the user explicitly asks to proceed

## Purpose

This skill helps an agent turn a request into a clear implementation plan:

1. Understand the actual task and success criteria
2. Gather the minimum useful context
3. Break the work into coherent subproblems
4. Identify risks, unknowns, and dependencies
5. Define validation and rollout checks
6. Deliver a practical plan that another agent or engineer can execute

## When To Invoke

Invoke this skill when:

- The user asks to plan a feature or task
- The user wants a work breakdown before coding
- The request is broad, ambiguous, or multi-step
- The user wants implementation steps, scope, or milestones
- The agent should pause and think before building

Do not invoke this skill when:

- The user clearly wants immediate implementation and the task is trivial
- The work is already fully scoped and only execution remains
- The user wants a bug investigation rather than a forward plan

## Operating Principles

- Prefer clarifying the goal before proposing solutions
- Prefer plans that are executable, not aspirational
- Prefer smaller, independently verifiable steps
- Prefer explicit assumptions over hidden ones
- Prefer identifying uncertainty early rather than during implementation
- Do not expand scope just because more work is possible

## Workflow

### 0. Confirm The Request

Restate the request in concrete terms:

- What the user wants changed or built
- Why it matters
- What success likely looks like

If the task is underspecified, ask only the most important clarifying questions.

### 1. Gather Planning Context

Collect just enough context to make a useful plan:

- Read the relevant files, docs, or architecture notes
- Identify the likely feature area or system boundary
- Check existing conventions and adjacent implementations
- Identify technical or product constraints

Do not do a full implementation investigation unless needed for planning.

### 2. Define Scope

Separate the work into:

- In scope
- Out of scope
- Assumptions
- Unknowns that may block execution

If the request is too large, propose a narrower first slice.

### 3. Break Down The Work

Produce a step-by-step plan with meaningful boundaries.

Good plan steps are:

- Small enough to execute
- Large enough to represent a coherent unit of work
- Ordered by dependency
- Easy to verify independently

Prefer plans that distinguish:

- Design or schema changes
- Backend logic changes
- Frontend or API surface changes
- Tests and verification
- Documentation or rollout tasks

### 4. Identify Risks And Dependencies

For each meaningful part of the plan, consider:

- Dependency on another module, service, or team
- Migration or compatibility risk
- Data-shape or state-transition risk
- Auth, permission, or trust-boundary risk
- Performance or scale risk
- UX or user-flow regression risk

Do not overdo this section. Focus on risks that change execution decisions.

### 5. Define Verification

Every plan should include a validation path before coding starts.

Include the strongest likely checks such as:

- Unit or integration tests
- Typecheck or lint
- Build or compile validation
- Manual flow checks
- Monitoring or rollout verification

If verification is unclear, call that out as a planning gap.

### 6. Deliver The Plan

End with a concrete output that can drive execution.

The final plan should usually include:

- Goal
- Scope
- Assumptions
- Step-by-step plan
- Risks
- Verification approach

Unless the user explicitly asks to continue, stop after presenting the plan.

## Tooling Guidance

Adapt to the current host's tools.

If file search and file read tools exist:

- Use them to understand the current system before planning changes

If issue trackers, tickets, or design docs exist:

- Use them to reconcile the request with prior decisions

If architecture or test docs exist:

- Use them to identify likely integration points and validation steps

If a tool does not exist in the current host:

- Degrade gracefully and state which planning assumptions remain unverified

## Output Contract

For planning tasks, the final answer should usually include:

- Goal
- Scope
- Assumptions or open questions
- Step-by-step implementation plan
- Risks
- Verification plan

For larger tasks, also include:

- Recommended first slice
- Dependencies or sequencing notes

If the plan is blocked by missing information, say exactly what is missing.

## Anti-Patterns

Do not:

- Jump into implementation without separating planning from execution
- Create a plan that is broader than the request
- Produce steps that cannot be independently verified
- Hide major assumptions
- Confuse architecture speculation with a practical execution plan
- Pretend the plan is final when key information is still missing

## Example Invocation Scenarios

- "Break this feature into steps"
- "Help me plan this implementation"
- "Decompose this task before we code"
- "What is the execution plan for this change?"
- "Turn this requirement into an actionable plan"

