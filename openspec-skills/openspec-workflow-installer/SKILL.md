---
name: "openspec-workflow-installer"
description: "Installs or updates OpenSpec workflow files in a project. Invoke when setting up openspec/, skills, commands, or agent integrations."
---

# OpenSpec Workflow Installer

## Purpose

Install or update the OpenSpec workflow assets that let an agent use a spec-driven process inside a repository.

This skill prepares the project for other OpenSpec skills. It does not plan a specific feature, implement code, sync specs, or archive changes.

## When To Invoke

Invoke when the user asks to:

- initialize OpenSpec in a project
- install a spec-driven workflow
- create the `openspec/` directory structure
- install or refresh agent skills or commands
- adapt an existing project for OpenSpec-style work
- update workflow instructions after changing tools or profiles

Do not invoke for normal feature implementation unless the workflow assets are missing.

## Inputs

Useful inputs include:

- target project path
- target agent host, such as Trae, Claude, or custom
- whether to include a sample `openspec/` template
- whether to update existing files or only install missing assets

## Repository Files

This skill may create or update:

- `openspec/`
- `openspec/config.yaml`
- `openspec/specs/`
- `openspec/changes/`
- `openspec/changes/archive/`
- agent skill directories, such as `.trae/skills/` or `.claude/skills/`
- agent command directories, such as `.trae/commands/` or `.claude/commands/`

## Procedure

1. Resolve the target project root.
2. Check whether `openspec/` already exists.
3. Detect existing agent-specific directories when possible.
4. Create the minimal `openspec/` directory structure if missing.
5. Create `openspec/config.yaml` only when missing or explicitly requested.
6. Install or update requested skills and command prompts.
7. Preserve user-authored files and avoid destructive replacement.
8. Report what was installed, skipped, or updated.

## Decision Rules

- If `openspec/` exists, treat the operation as an update or extension.
- If a target file exists and is user-authored, do not overwrite it without user approval.
- If the target agent is unclear, ask which host should be configured.
- If the user wants a template and `openspec/` already exists, ask before adding example content.

## Guardrails

- Never delete existing workflow assets unless the user explicitly requests cleanup.
- Never overwrite `openspec/config.yaml` silently.
- Never install sample changes into an existing real project without confirmation.
- Keep installation separate from feature planning or implementation.

## Output Format

```text
OpenSpec workflow installation
Target: <project-root>
Mode: <install|update>

Created:
- <path>

Updated:
- <path>

Skipped:
- <path> (<reason>)

Next action: <recommended next step>
```

## Examples

User: "Install OpenSpec workflow in this project for Trae."

Action: create `openspec/`, install Trae skill and command prompts, then report installed paths.
