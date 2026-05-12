---
name: "gstack-office-hours"
description: "Reframes a request into the real problem, user pain, and product direction. Invoke when the user has an idea, wants brainstorming, or needs help deciding what is worth building."
---

# GStack Office Hours

Use this skill as a portable product-framing workflow for coding agents.

This skill is designed for general agent environments. It does not assume a
specific planning system, host runtime, or research stack. Adapt the workflow
to the tools available in the current environment.

Its job is to turn an initial idea into a sharper problem statement:

- Clarify what the user is actually trying to solve
- Surface the real user pain and current workaround
- Challenge shallow feature framing
- Narrow to a realistic first wedge
- Expose major assumptions early
- Stop before detailed implementation planning unless explicitly asked

## Purpose

This skill helps an agent turn a rough idea into a clearer product direction:

1. Understand the proposed idea
2. Identify the underlying user problem
3. Clarify current behavior, workaround, and urgency
4. Challenge weak framing or oversized scope
5. Propose a narrower and more testable wedge
6. Hand off a crisp problem definition for planning

## When To Invoke

Invoke this skill when:

- The user says they have an idea
- The user wants brainstorming or product thinking
- The request is still at the concept stage
- The user asks whether something is worth building
- The user is framing a feature but the real goal is still unclear

Do not invoke this skill when:

- The task is already well-defined and needs execution
- The main need is detailed implementation planning
- The main need is code review or debugging

## Operating Principles

- Prefer uncovering the real problem before discussing solutions
- Prefer concrete user pain over abstract opportunity
- Prefer narrow wedges over broad platforms
- Prefer explicit assumptions over optimistic guesses
- Challenge framing, but do not argue for the sake of arguing
- Stop once the direction is clear enough to plan

## Workflow

### 0. Restate The Idea

Start by restating the user's idea in simple terms.

Clarify:

- What they think they want to build
- Who it is for
- What result they hope it creates

If the idea is already crisp, do not overcomplicate it.

### 1. Find The Real Problem

Push past the surface request.

Look for:

- The specific user pain
- The current workaround
- The cost of leaving the problem unsolved
- Whether the problem is frequent, urgent, or painful enough to matter

If the request sounds like a feature without a problem behind it, say so
clearly.

### 2. Test The Framing

Challenge weak assumptions such as:

- The proposed feature is the only solution
- The broad platform must be built first
- More scope means more value
- The user knows the exact product shape already

Use concise pushback. The goal is to improve the request, not shut it down.

### 3. Identify The Narrowest Wedge

Propose the smallest useful version that:

- Solves a real pain
- Can be validated quickly
- Reduces product and implementation risk
- Creates a clear learning loop

If the idea is too broad, explicitly recommend a smaller first slice.

### 4. Surface Assumptions And Unknowns

Call out the assumptions that matter most, such as:

- Demand assumptions
- User behavior assumptions
- Workflow assumptions
- Integration assumptions
- Trust or permission assumptions

Distinguish:

- What is known
- What is inferred
- What still needs validation

### 5. Produce A Framed Direction

End with a clear handoff artifact that includes:

- Problem statement
- Target user
- Current pain or workaround
- Suggested product wedge
- Biggest assumptions
- What should be planned next

Unless the user explicitly asks to continue, stop at this framing stage.

## Tooling Guidance

Adapt to the current host's tools.

If docs, notes, or existing product context exist:

- Read enough to avoid redundant framing

If search or web tools exist:

- Use them only when market or workflow context is necessary

If the host supports structured questions:

- Ask a few sharp questions instead of many shallow ones

If a tool does not exist in the current host:

- Degrade gracefully and be explicit about which assumptions remain unverified

## Output Contract

For framing tasks, the final answer should usually include:

- Restated idea
- Real problem
- Who has the problem
- Why it matters now
- Recommended wedge
- Assumptions and open questions
- Suggested next step

## Anti-Patterns

Do not:

- Accept the first framing without testing it
- Jump into implementation details too early
- Inflate scope because the broader idea sounds impressive
- Confuse brainstorming with random ideation
- Hide the fact that the problem is still unclear
- Force a complicated strategy when a narrow wedge is enough

## Example Invocation Scenarios

- "I have an idea"
- "Help me think this through"
- "Is this worth building?"
- "Brainstorm this with me"
- "What should we actually build here?"

