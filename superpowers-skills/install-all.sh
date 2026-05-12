#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_ROOT="${1:-$PWD}"

usage() {
  cat <<'EOF'
Usage:
  ./install-all.sh /path/to/target-project
  ./install-all.sh

Installs the superpowers skill suite into:
  - <target>/.trae/skills
  - <target>/.claude/skills
  - <target>/.trae/commands/superpowers
  - <target>/.claude/commands/superpowers
EOF
}

if [[ "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

mkdir -p "$TARGET_ROOT"
TARGET_ROOT="$(cd "$TARGET_ROOT" && pwd)"

TRAE_SKILLS_DIR="$TARGET_ROOT/.trae/skills"
TRAE_COMMANDS_DIR="$TARGET_ROOT/.trae/commands/superpowers"

CLAUDE_SKILLS_DIR="$TARGET_ROOT/.claude/skills"
CLAUDE_COMMANDS_DIR="$TARGET_ROOT/.claude/commands/superpowers"

SKILL_NAMES=(
  "superpowers-using-superpowers"
  "superpowers-brainstorming"
  "superpowers-writing-plans"
  "superpowers-test-driven-development"
  "superpowers-systematic-debugging"
  "superpowers-executing-plans"
  "superpowers-subagent-driven-development"
  "superpowers-dispatching-parallel-agents"
  "superpowers-requesting-code-review"
  "superpowers-receiving-code-review"
  "superpowers-verification-before-completion"
  "superpowers-finishing-a-development-branch"
  "superpowers-using-git-worktrees"
  "superpowers-writing-skills"
)

copy_dir() {
  local src="$1"
  local dst="$2"
  mkdir -p "$(dirname "$dst")"
  rm -rf "$dst"
  cp -R "$src" "$dst"
}

verify_source() {
  local skill
  for skill in "${SKILL_NAMES[@]}"; do
    if [[ ! -f "$SCRIPT_DIR/$skill/SKILL.md" ]]; then
      echo "Missing skill source: $SCRIPT_DIR/$skill/SKILL.md"
      exit 1
    fi
  done
}

copy_skill_to() {
  local base="$1"
  local name="$2"
  copy_dir "$SCRIPT_DIR/$name" "$base/$name"
}

write_trae_command() {
  local id="$1"
  local skill="$2"
  local dst="$TRAE_COMMANDS_DIR/$id.md"
  mkdir -p "$TRAE_COMMANDS_DIR"
  cat >"$dst" <<EOF
# superpowers:$id

Use the \`$skill\` skill.

Input:

\`\`\`text
\$ARGUMENTS
\`\`\`

Requirements:

- Follow the skill exactly and use its required workflow
- Treat \$ARGUMENTS as optional task context, file path, or plan path
- If the skill routes to another \`superpowers:*\` skill, continue with that skill
EOF
}

write_claude_command() {
  local id="$1"
  local skill="$2"
  local title="$3"
  local desc="$4"
  local dst="$CLAUDE_COMMANDS_DIR/$id.md"
  mkdir -p "$CLAUDE_COMMANDS_DIR"
  cat >"$dst" <<EOF
---
name: $title
description: $desc
category: Workflow
tags: [superpowers, workflow]
---

Use the \`$skill\` skill.

<UserInput>
\$ARGUMENTS
</UserInput>

Requirements:

- Follow the skill exactly and use its required workflow
- Treat \$ARGUMENTS as optional task context, file path, or plan path
- If the skill routes to another \`superpowers:*\` skill, continue with that skill
EOF
}

install_commands() {
  write_trae_command "using-superpowers" "superpowers-using-superpowers"
  write_trae_command "brainstorming" "superpowers-brainstorming"
  write_trae_command "writing-plans" "superpowers-writing-plans"
  write_trae_command "test-driven-development" "superpowers-test-driven-development"
  write_trae_command "systematic-debugging" "superpowers-systematic-debugging"
  write_trae_command "executing-plans" "superpowers-executing-plans"
  write_trae_command "subagent-driven-development" "superpowers-subagent-driven-development"
  write_trae_command "dispatching-parallel-agents" "superpowers-dispatching-parallel-agents"
  write_trae_command "requesting-code-review" "superpowers-requesting-code-review"
  write_trae_command "receiving-code-review" "superpowers-receiving-code-review"
  write_trae_command "verification-before-completion" "superpowers-verification-before-completion"
  write_trae_command "finishing-a-development-branch" "superpowers-finishing-a-development-branch"
  write_trae_command "using-git-worktrees" "superpowers-using-git-worktrees"
  write_trae_command "writing-skills" "superpowers-writing-skills"

  write_claude_command "using-superpowers" "superpowers-using-superpowers" "Superpowers Start" "Load the Superpowers entry skill and route to the right workflow."
  write_claude_command "brainstorming" "superpowers-brainstorming" "Superpowers Brainstorming" "Turn a fuzzy request into a validated design."
  write_claude_command "writing-plans" "superpowers-writing-plans" "Superpowers Writing Plans" "Write an actionable implementation plan before coding."
  write_claude_command "test-driven-development" "superpowers-test-driven-development" "Superpowers TDD" "Implement work using a strict RED-GREEN-REFACTOR loop."
  write_claude_command "systematic-debugging" "superpowers-systematic-debugging" "Superpowers Debugging" "Debug failures methodically before attempting fixes."
  write_claude_command "executing-plans" "superpowers-executing-plans" "Superpowers Execute Plan" "Execute a saved plan step by step in a single session."
  write_claude_command "subagent-driven-development" "superpowers-subagent-driven-development" "Superpowers Subagent Development" "Execute a plan with specialized subagents."
  write_claude_command "dispatching-parallel-agents" "superpowers-dispatching-parallel-agents" "Superpowers Parallel Dispatch" "Run independent work streams in parallel."
  write_claude_command "requesting-code-review" "superpowers-requesting-code-review" "Superpowers Request Review" "Dispatch a focused code-review subagent with the right context."
  write_claude_command "receiving-code-review" "superpowers-receiving-code-review" "Superpowers Receive Review" "Process review feedback without losing correctness."
  write_claude_command "verification-before-completion" "superpowers-verification-before-completion" "Superpowers Verify" "Verify evidence before claiming work is complete."
  write_claude_command "finishing-a-development-branch" "superpowers-finishing-a-development-branch" "Superpowers Finish Branch" "Wrap up a development branch after implementation is complete."
  write_claude_command "using-git-worktrees" "superpowers-using-git-worktrees" "Superpowers Git Worktrees" "Set up safe isolated workspaces with git worktrees."
  write_claude_command "writing-skills" "superpowers-writing-skills" "Superpowers Writing Skills" "Create or revise portable skills using the Superpowers conventions."
}

echo "Installing Superpowers skills into:"
echo "  Target: $TARGET_ROOT"

verify_source

mkdir -p "$TRAE_SKILLS_DIR" "$CLAUDE_SKILLS_DIR"

for skill in "${SKILL_NAMES[@]}"; do
  copy_skill_to "$TRAE_SKILLS_DIR" "$skill"
  copy_skill_to "$CLAUDE_SKILLS_DIR" "$skill"
done

install_commands

echo
echo "Installed skills:"
echo "  Trae:   $TRAE_SKILLS_DIR/superpowers-*/"
echo "  Claude: $CLAUDE_SKILLS_DIR/superpowers-*/"
echo
echo "Installed commands:"
echo "  Trae:   $TRAE_COMMANDS_DIR/*.md"
echo "  Claude: $CLAUDE_COMMANDS_DIR/*.md"
echo
cat <<'EOF'
Next steps:
  1. Restart or reload your agent host if it caches local skills or commands.
  2. Start with:
     - superpowers:using-superpowers
     - superpowers:writing-plans <feature>
     - superpowers:systematic-debugging <failure>
EOF