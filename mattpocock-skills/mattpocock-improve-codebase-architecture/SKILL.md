# Mattpocock Improve Codebase Architecture

Run an architecture health pass focused on depth, locality, leverage, and testability. The output is a visual report of deepening candidates, followed by a Mattpocock Grill Me style interview for the candidate the user chooses.

## When To Use

Use when tests are awkward, modules are shallow, behavior leaks across seams, or future changes require too much codebase context.

## Core Idea

Architecture work should make future behavior easier to add and verify. The target is not aesthetic cleanup; the target is deeper modules: smaller interfaces hiding more behavior, with tests crossing the same seams as callers.

## Inputs

Read what exists:

- `CONTEXT.md` or `CONTEXT-MAP.md`
- relevant ADRs in `docs/adr/`
- build/test scripts
- the modules near the user's area of concern, or the highest-churn areas if no area is specified

Proceed silently when domain docs are absent.

## Explore

Look for friction, not just smells:

- understanding one behavior requires bouncing across many files
- tests must mock internal collaborators
- call sites repeat the same ordering, validation, or data-shaping knowledge
- modules are shallow: their interface is nearly as complex as their implementation
- external integrations leak through multiple callers
- a seam exists with only one adapter and no real variation
- code is hard to test except by poking internals

Use the `mattpocock-codebase-design` vocabulary exactly: module, interface, implementation, depth, seam, adapter, leverage, locality.

## Candidate Shape

Each candidate should include:

- **Files**: the involved modules
- **Problem**: the friction in current terms
- **Proposed deepening**: what behavior moves behind which interface
- **Dependency category**: in-process, local-substitutable, owned remote, or true external
- **Testing effect**: what tests can move to the new interface
- **Recommendation strength**: Strong, Worth exploring, or Speculative
- **ADR conflict**: only when a real existing decision would be reopened

Do not propose a final interface in the first report. The report selects a problem; the Mattpocock Grill Me interview loop designs the solution.

## Report

Write a self-contained HTML report outside the repo:

- macOS/Linux: use `$TMPDIR` if set, otherwise `/tmp`
- Windows: use `%TEMP%`
- write to `architecture-review-<timestamp>.html`

Open it for the user and provide the absolute path.

The report should be visual and concise. Use plain HTML and CSS so the file works offline in locked-down environments.

- plain HTML/CSS for layout
- inline SVG or simple boxes for before/after diagrams
- side-by-side before/after view for each candidate
- one top recommendation at the end

Minimal scaffold:

```html
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>Architecture review</title>
    <style>
      body { font-family: system-ui, sans-serif; margin: 0; background: #fafaf9; color: #0f172a; }
      main { max-width: 1100px; margin: 0 auto; padding: 48px 24px; }
      article { background: white; border: 1px solid #e2e8f0; border-radius: 16px; padding: 24px; margin: 24px 0; }
      .grid { display: grid; grid-template-columns: 1fr 1fr; gap: 16px; }
      .box { border: 1px solid #cbd5e1; border-radius: 12px; padding: 16px; }
      .deep { background: #0f172a; color: white; }
      .badge { display: inline-block; padding: 4px 8px; border-radius: 999px; background: #ecfdf5; color: #047857; }
    </style>
  </head>
  <body>
    <main>
      <!-- candidate cards -->
    </main>
  </body>
</html>
```

Candidate cards should be sparse. The diagram should do most of the work.

## After The Report

Ask:

```text
Which candidate would you like to explore?
```

When the user picks one, run the Mattpocock Grill Me interview loop:

- clarify what the new module owns
- choose the seam
- decide dependencies and adapters
- define what tests cross the interface
- record new domain terms through `mattpocock-domain-modeling`
- offer an ADR only for durable, surprising trade-offs

If the user wants alternative interfaces, use the `mattpocock-codebase-design` "design it twice" pattern: compare at least two materially different interface shapes and recommend one.

## Non-Goals

- Do not mass-refactor during the review.
- Do not list cosmetic cleanup.
- Do not create interfaces just for their own sake.
- Do not reopen ADRs unless current friction is strong enough to justify it.
