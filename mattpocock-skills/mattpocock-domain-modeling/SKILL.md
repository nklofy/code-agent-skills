# Mattpocock Domain Modeling

Use this skill when the work changes the language of the project, not merely when reading existing docs. Its job is to keep the domain glossary and durable decisions aligned with what the code and user actually mean.

## Read Path

Before planning or architecture work, look for:

- `CONTEXT-MAP.md`: multi-context repo; follow it to relevant context files.
- `CONTEXT.md`: single-context repo; read it for vocabulary.
- `docs/adr/`: repo-level architectural decisions.
- context-local `docs/adr/` directories if a multi-context map points to them.

If none exist, proceed silently. Create docs only when there is something concrete to record.

## Glossary Rules

Write domain terms in `CONTEXT.md`, not implementation notes.

Use this shape:

```md
# <Context Name>

One or two sentences describing this business or product context.

## Language

**Order**:
A customer commitment to buy one or more items.
_Avoid_: Purchase, transaction
```

Rules:

- Define what the term is, not what code does with it.
- Keep definitions to one or two sentences.
- Pick one canonical term and list rejected synonyms under `_Avoid_`.
- Exclude generic programming vocabulary.
- Update the glossary as soon as a term is resolved; do not batch it until the end.

## During A Conversation

Actively challenge unclear language:

- "You said account. Does that mean Customer, User, or Billing Account here?"
- "The glossary says cancellation applies to the whole Order; your example implies partial cancellation. Which is correct?"
- "The code names this Shipment, but the product language says Fulfillment. Which term should win?"

Use concrete edge cases to force precision.

## ADR Rules

Create an ADR only when all three are true:

- The decision is expensive to reverse.
- A future maintainer would not infer the reason from code alone.
- There was a real trade-off among plausible alternatives.

ADRs live in `docs/adr/` by default and use sequential names:

```text
docs/adr/0001-short-slug.md
docs/adr/0002-short-slug.md
```

Minimal ADR format:

```md
# <Decision Title>

One to three sentences explaining the context, the decision, and why this trade-off was chosen.
```

Optional sections such as Status, Considered Options, and Consequences are allowed only when they add signal.

## Conflict Handling

If a proposed plan contradicts an ADR, call it out explicitly. Do not silently override prior decisions.

Use this form:

```text
Contradicts ADR-0007 (<title>) — worth reopening because <current evidence>.
```
