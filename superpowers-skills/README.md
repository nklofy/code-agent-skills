# Superpowers Skills

`superpowers-skills` contains prefixed copies of the bundled skills from `.trae/skills/mini-superpowers`.

This directory is intended for agents or platforms that prefer flat skill names instead of nested names like `mini-superpowers/brainstorming`.

It now also includes `mini-superpowers`, a compact standalone skill that can replace the suite for lower-cost usage.

## Quick Install

From the repository root:

```bash
./superpowers-skills/install-all.sh /path/to/target-project
```

This installs:

- `mini-superpowers`
- All `superpowers-*` skill directories into `<target-project>/.trae/skills/`
- All `superpowers-*` skill directories into `<target-project>/.claude/skills/`
- Trae command prompts into `<target-project>/.trae/commands/superpowers/`
- Claude command prompts into `<target-project>/.claude/commands/superpowers/`

If you only want the lowest-cost standalone mode, installing just `mini-superpowers/` is usually enough.

If you omit the target path, the script installs into the current working directory:

```bash
./superpowers-skills/install-all.sh
```

## Installed Layout

Trae:

```text
<target-project>/
└── .trae/
    ├── skills/
    │   ├── mini-superpowers/
    │   │   └── SKILL.md
    │   └── superpowers-*/
    │       ├── SKILL.md
    │       └── ...
    └── commands/
        └── superpowers/
            ├── mini.md
            ├── using-superpowers.md
            ├── brainstorming.md
            ├── writing-plans.md
            ├── test-driven-development.md
            ├── systematic-debugging.md
            ├── executing-plans.md
            ├── subagent-driven-development.md
            ├── dispatching-parallel-agents.md
            ├── requesting-code-review.md
            ├── receiving-code-review.md
            ├── verification-before-completion.md
            ├── finishing-a-development-branch.md
            ├── using-git-worktrees.md
            └── writing-skills.md
```

Claude:

```text
<target-project>/
└── .claude/
    ├── skills/
    │   ├── mini-superpowers/
    │   │   └── SKILL.md
    │   └── superpowers-*/
    │       ├── SKILL.md
    │       └── ...
    └── commands/
        └── superpowers/
            └── *.md
```

## Recommended Command Entry Points

The installer creates command prompts that map directly to the skill references used inside the Superpowers docs:

- `superpowers:mini`
- `superpowers:using-superpowers`
- `superpowers:brainstorming`
- `superpowers:writing-plans`
- `superpowers:test-driven-development`
- `superpowers:systematic-debugging`
- `superpowers:executing-plans`
- `superpowers:subagent-driven-development`
- `superpowers:dispatching-parallel-agents`
- `superpowers:requesting-code-review`
- `superpowers:receiving-code-review`
- `superpowers:verification-before-completion`
- `superpowers:finishing-a-development-branch`
- `superpowers:using-git-worktrees`
- `superpowers:writing-skills`

## What Changed

- Source skill directories were copied from `.trae/skills/mini-superpowers/<skill>`.
- Each output directory is renamed to `superpowers-<skill>`.
- Each copied `SKILL.md` frontmatter `name` is updated to match the new prefixed name.
- Supporting files are preserved, including prompts, references, examples, and scripts.

## Recommended Entry Skill

Start with:

```text
mini-superpowers
```

Then route to the relevant skill:

- `mini-superpowers` when you want one standalone skill with lower loading cost
- `superpowers-using-superpowers` when you want the full upstream skill-loading discipline
- `superpowers-brainstorming` for requirements and design
- `superpowers-writing-plans` for implementation plans
- `superpowers-test-driven-development` for code changes
- `superpowers-systematic-debugging` for failures
- `superpowers-requesting-code-review` and `superpowers-receiving-code-review` for review workflows
- `superpowers-verification-before-completion` before claiming work is done
- `superpowers-finishing-a-development-branch` for final branch handling
- `superpowers-writing-skills` for creating or editing skills

## Suggested Bootstrap

```text
You have access to the superpowers-* skill set.
When cost matters, use mini-superpowers as the single standalone workflow skill.
If you need the full upstream skill-loading discipline and platform-specific guidance, then load superpowers-using-superpowers.
Otherwise route to a more specific superpowers-* skill only when specialization is worth the extra context cost.
Do not act from memory when a relevant superpowers-* skill is available.
```

## Skill List

- `mini-superpowers` standalone low-cost replacement skill (Entry)
- `superpowers-brainstorming` from `brainstorming` (Core)
- `superpowers-dispatching-parallel-agents` from `dispatching-parallel-agents` (Execution)
- `superpowers-executing-plans` from `executing-plans` (Core)
- `superpowers-finishing-a-development-branch` from `finishing-a-development-branch` (Core)
- `superpowers-receiving-code-review` from `receiving-code-review` (Review)
- `superpowers-requesting-code-review` from `requesting-code-review` (Review)
- `superpowers-subagent-driven-development` from `subagent-driven-development` (Execution)
- `superpowers-systematic-debugging` from `systematic-debugging` (Core)
- `superpowers-test-driven-development` from `test-driven-development` (Core)
- `superpowers-using-git-worktrees` from `using-git-worktrees` (Core)
- `superpowers-using-superpowers` from `using-superpowers` (Entry)
- `superpowers-verification-before-completion` from `verification-before-completion` (Core)
- `superpowers-writing-plans` from `writing-plans` (Core)
- `superpowers-writing-skills` from `writing-skills` (Meta)

## Validation

Each skill directory should contain `SKILL.md`. Some skills also include supporting files such as prompts, examples, references, or scripts.

After running the installer, verify a few representative files:

```text
<target-project>/.trae/skills/mini-superpowers/SKILL.md
<target-project>/.trae/skills/superpowers-using-superpowers/SKILL.md
<target-project>/.trae/skills/superpowers-brainstorming/visual-companion.md
<target-project>/.claude/skills/superpowers-requesting-code-review/code-reviewer.md
<target-project>/.trae/commands/superpowers/mini.md
<target-project>/.trae/commands/superpowers/using-superpowers.md
<target-project>/.claude/commands/superpowers/systematic-debugging.md
```

Then try one of these prompts in your host:

```text
superpowers:mini
superpowers:using-superpowers
superpowers:writing-plans improve login retries
superpowers:systematic-debugging flaky test in payments
```

For lower-cost usage, start and stay in `superpowers:mini` unless the task clearly benefits from a more specialized skill.

## Origin and Attribution

These skills are derived from the Superpowers project by Jesse Vincent and contributors.

Original project:
https://github.com/obra/superpowers

This directory contains prefixed copies of selected Superpowers skills for easier use in agents or platforms that prefer flat skill names. The skill content and supporting files remain based on the original Superpowers workflow and philosophy.

Superpowers is licensed under the MIT License. See the upstream repository for the original license, history, and contribution guidelines.