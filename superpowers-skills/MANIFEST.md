# Superpowers Skills Manifest

## Package

- Name: `superpowers-skills`
- Source: `.trae/skills/mini-superpowers` sub skills
- Output: `superpowers-skills`
- Naming: each copied skill directory and frontmatter `name` uses the `superpowers-` prefix

## Skills

| Output Skill | Source Skill | Category | Path |
|---|---|---|---|
| `superpowers-brainstorming` | `brainstorming` | Core | `superpowers-brainstorming/SKILL.md` |
| `superpowers-dispatching-parallel-agents` | `dispatching-parallel-agents` | Execution | `superpowers-dispatching-parallel-agents/SKILL.md` |
| `superpowers-executing-plans` | `executing-plans` | Core | `superpowers-executing-plans/SKILL.md` |
| `superpowers-finishing-a-development-branch` | `finishing-a-development-branch` | Core | `superpowers-finishing-a-development-branch/SKILL.md` |
| `superpowers-receiving-code-review` | `receiving-code-review` | Review | `superpowers-receiving-code-review/SKILL.md` |
| `superpowers-requesting-code-review` | `requesting-code-review` | Review | `superpowers-requesting-code-review/SKILL.md` |
| `superpowers-subagent-driven-development` | `subagent-driven-development` | Execution | `superpowers-subagent-driven-development/SKILL.md` |
| `superpowers-systematic-debugging` | `systematic-debugging` | Core | `superpowers-systematic-debugging/SKILL.md` |
| `superpowers-test-driven-development` | `test-driven-development` | Core | `superpowers-test-driven-development/SKILL.md` |
| `superpowers-using-git-worktrees` | `using-git-worktrees` | Core | `superpowers-using-git-worktrees/SKILL.md` |
| `superpowers-using-superpowers` | `using-superpowers` | Entry | `superpowers-using-superpowers/SKILL.md` |
| `superpowers-verification-before-completion` | `verification-before-completion` | Core | `superpowers-verification-before-completion/SKILL.md` |
| `superpowers-writing-plans` | `writing-plans` | Core | `superpowers-writing-plans/SKILL.md` |
| `superpowers-writing-skills` | `writing-skills` | Meta | `superpowers-writing-skills/SKILL.md` |

## Bootstrap

```text
You have access to the superpowers-* skill set.
Before development work, load superpowers-using-superpowers first, then follow its guidance to select the relevant superpowers-* skill.
For feature work use brainstorming, writing plans, TDD, review, verification, and finishing skills as appropriate.
For failures use superpowers-systematic-debugging before applying fixes.
```
