# Release Checklist

Use this checklist before publishing the bundle to another agent environment.

## Portability

- [ ] Every skill is plain Markdown.
- [ ] Every skill can be read without running a setup command.
- [ ] No skill requires command prefixes, plugin manifests, or platform-specific fields.
- [ ] No skill names a specific agent runtime as a requirement.
- [ ] No YAML frontmatter is required.
- [ ] Each skill starts with a title and a "When To Use" section or equivalent trigger paragraph.

## Defaults

- [ ] PRDs write to `.scratch/<feature-slug>/PRD.md`.
- [ ] Issues write to `.scratch/<feature-slug>/issues/`.
- [ ] Missing `CONTEXT.md` is allowed.
- [ ] Missing `docs/adr/` is allowed.
- [ ] Source material outside the repo is handled by pasted or exported text, not baked-in workflow.

## Runtime Assumptions

- [ ] No network access is required.
- [ ] No remote assets are required.
- [ ] No external tracker CLI is required.
- [ ] HTML output works as a static local file.
- [ ] File paths are conventional but not mandatory; the user can override them.

## Skill Quality

- [ ] Each skill has a clear trigger.
- [ ] Each skill has a clear output.
- [ ] Cross-skill references use natural names, not command syntax.
- [ ] The workflow can stop after any artifact: grilled decision summary, PRD, issues, implementation, or architecture report.
- [ ] The instructions tell the agent when to ask the user and when to proceed.

## Maintenance

- [ ] Keep the bundle small enough for agents to read selectively.
- [ ] Prefer examples over configuration.
- [ ] Prefer local Markdown over integrations.
- [ ] Add dependencies only when they remove more complexity than they introduce.
