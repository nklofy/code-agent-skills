# Mini Skills Optimization Spec

## Goal

Optimize the 3 standalone `mini-*` skills so they can be installed and used by
themselves as lower-cost replacements for their full package suites.

## Background

The current `mini-*` skills already position themselves as low-cost
alternatives, but they still read too much like summary or routing layers.

The next revision should make each file feel like a complete, self-sufficient
workflow skill that:

- works well when it is the only installed skill from that package
- carries the most valuable guidance from its sibling skills
- mentions sibling skills only as optional escalation paths
- contains more high-signal operational detail, heuristics, and guardrails

## Non-Goals

- Reproducing every detail from the full package
- Requiring users to install the sibling skills
- Changing package structure or installer behavior in this step

## Constraints

- Prioritize the standalone `mini-*` usage scenario
- Expand each file materially, roughly 3x to 5x in useful substance
- Preserve concise, actionable guidance rather than dumping raw upstream text
- Keep references to sibling skills optional and secondary

## Success Criteria

Each `mini-*` skill should:

- read as a complete skill, not just an entry point
- provide a full workflow with concrete phases and decision rules
- include practical guardrails and anti-patterns
- include reusable output formats and operating guidance
- make it obvious how to use the skill when it is the only installed skill

## Execution Plan

### Task 1: `mini-openspec`

Focus:

- Make it a true single-file OpenSpec workflow
- Cover setup, planning, readiness, implementation, sync, and archive
- Include artifact standards, phase transitions, and common blocking patterns

### Task 2: `mini-superpowers`

Focus:

- Make it a complete low-cost engineering workflow
- Distill brainstorming, planning, disciplined implementation, debugging,
  review, verification, and branch completion
- Include strong anti-rationalization guardrails

### Task 3: `mini-gstack`

Focus:

- Make it a compact end-to-end engineering operating skill
- Distill framing, planning, execution, review, and debugging
- Emphasize portability, bounded scope, and evidence-backed work

## Verification

After each task:

- Read the revised file for coherence and standalone usability
- Check diagnostics for the edited file

After all 3 tasks:

- Re-check diagnostics for all 3 files
- Confirm each file now frames sibling skills as optional escalation, not a
  default dependency