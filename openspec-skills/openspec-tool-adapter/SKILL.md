---
name: "openspec-tool-adapter"
description: "Adapts OpenSpec workflows to agent tools by generating skills, commands, and mount docs. Invoke when porting to Trae, Claude, or custom agents."
---

# OpenSpec Tool Adapter

## Purpose

Convert OpenSpec workflow content into host-specific skills, commands, prompts, or mounting documentation.

This skill handles portability across agent tools. It does not plan or implement application features.

## When To Invoke

Invoke when the user asks to:

- adapt OpenSpec to Trae, Claude, or another agent
- generate command prompts
- create host-specific mount examples
- package skills for reuse
- document installation and trigger mappings
- convert a generic workflow into a specific tool format

## Inputs

Useful inputs include:

- target host name
- source skill or command prompt directory
- desired command names
- supported frontmatter format
- target installation path
- whether to include examples or scripts

## Repository Files

This skill may create or update:

- `.trae/skills/**/SKILL.md`
- `.trae/commands/**.md`
- `.claude/commands/**.md`
- `commands/**.md`
- `mount-examples/**`
- `MANIFEST.md`
- install scripts such as `install-to-trae.sh`

## Procedure

1. Identify the target host and supported file format.
2. Separate generic workflow instructions from host-specific wrapping.
3. Generate host-specific files in the expected directory layout.
4. Add frontmatter only when the host expects it.
5. Preserve command names, trigger phrases, and parameter conventions.
6. Generate or update a manifest that maps source files to mounted files.
7. Include installation notes or scripts when requested.
8. Report generated files and assumptions.

## Decision Rules

- If host format is known, follow that host's convention.
- If host format is unknown, generate plain Markdown prompt files and label them as examples.
- If parameter syntax is unknown, document placeholders rather than pretending support.
- Keep tool-specific formatting outside the core skill text.

## Guardrails

- Do not claim an unofficial format is official.
- Do not hard-code one host into generic skill content.
- Do not remove source prompt files after generating mounted copies.
- Do not overwrite existing host commands without user approval.
- Keep adapter output reproducible and documented.

## Output Format

```text
OpenSpec tool adapter
Target host: <host>

Generated:
- <path>

Assumptions:
- <assumption>

Next action: <recommended next step>
```

## Examples

User: "Generate Claude and Trae command mount examples."

Action: create host-specific command files, document paths in `MANIFEST.md`, and clearly label any unofficial assumptions.
