#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_ROOT="${1:-$PWD}"
WITH_OPENSPEC_TEMPLATE="${2:-}"

TARGET_ROOT="$(cd "$TARGET_ROOT" && pwd)"

TRAE_SKILLS_DIR="$TARGET_ROOT/.trae/skills"
TRAE_COMMANDS_DIR="$TARGET_ROOT/.trae/commands/openspec"

CLAUDE_SKILLS_DIR="$TARGET_ROOT/.claude/skills"
CLAUDE_COMMANDS_DIR="$TARGET_ROOT/.claude/commands/openspec"

SKILL_NAMES=(
  "openspec-workflow-installer"
  "openspec-change-planning"
  "openspec-artifact-status"
  "openspec-change-implementation"
  "openspec-spec-sync"
  "openspec-archive"
  "openspec-tool-adapter"
)

copy_file() {
  local src="$1"
  local dst="$2"
  mkdir -p "$(dirname "$dst")"
  cp "$src" "$dst"
}

copy_skill_to() {
  local base="$1" # .trae/skills or .claude/skills
  local name="$2"
  local src="$SCRIPT_DIR/$name/SKILL.md"
  local dst="$base/$name/SKILL.md"
  if [[ ! -f "$src" ]]; then
    echo "Missing skill source: $src"
    exit 1
  fi
  copy_file "$src" "$dst"
}

write_trae_command() {
  local id="$1"
  local skill="$2"
  local dst="$TRAE_COMMANDS_DIR/$id.md"
  mkdir -p "$TRAE_COMMANDS_DIR"
  cat >"$dst" <<EOF
# openspec:$id

Use the \`$skill\` skill.

Input:

\`\`\`text
\$ARGUMENTS
\`\`\`

Requirements:

- Follow the skill's guardrails and output format
- Treat \$ARGUMENTS as optional change name or context hint
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
tags: [openspec, workflow]
---

Use the \`$skill\` skill.

<UserInput>
\$ARGUMENTS
</UserInput>

Requirements:

- Follow the skill's guardrails and output format
- Treat \$ARGUMENTS as optional change name or context hint
EOF
}

install_commands() {
  # Common command set for both hosts
  write_trae_command "install" "openspec-workflow-installer"
  write_trae_command "plan" "openspec-change-planning"
  write_trae_command "status" "openspec-artifact-status"
  write_trae_command "apply" "openspec-change-implementation"
  write_trae_command "sync" "openspec-spec-sync"
  write_trae_command "archive" "openspec-archive"
  write_trae_command "adapt" "openspec-tool-adapter"

  write_claude_command "install" "openspec-workflow-installer" "OpenSpec Install" "Install or update OpenSpec workflow assets."
  write_claude_command "plan" "openspec-change-planning" "OpenSpec Plan" "Plan a new OpenSpec change with proposal, design, tasks, and specs."
  write_claude_command "status" "openspec-artifact-status" "OpenSpec Status" "Report OpenSpec change status and the next action."
  write_claude_command "apply" "openspec-change-implementation" "OpenSpec Apply" "Implement the next tasks for an OpenSpec change."
  write_claude_command "sync" "openspec-spec-sync" "OpenSpec Sync" "Sync approved delta specs into canonical main specs."
  write_claude_command "archive" "openspec-archive" "OpenSpec Archive" "Archive a completed OpenSpec change safely."
  write_claude_command "adapt" "openspec-tool-adapter" "OpenSpec Adapt" "Generate host-specific OpenSpec mounting assets."
}

install_template() {
  if [[ "$WITH_OPENSPEC_TEMPLATE" != "--with-openspec-template" ]]; then
    return 0
  fi
  local src_dir="$SCRIPT_DIR/../.trae/skills/spec-driven-workflow/template/openspec"
  if [[ ! -d "$src_dir" ]]; then
    echo "Template source not found: $src_dir"
    echo "Install skills only, or provide your own openspec/ directory."
    exit 1
  fi
  if [[ -e "$TARGET_ROOT/openspec" ]]; then
    echo "Refusing to overwrite existing $TARGET_ROOT/openspec"
    exit 1
  fi
  mkdir -p "$TARGET_ROOT/openspec"
  cp -R "$src_dir"/. "$TARGET_ROOT/openspec"/
}

echo "Installing OpenSpec skills into:"
echo "  Target: $TARGET_ROOT"

mkdir -p "$TRAE_SKILLS_DIR" "$CLAUDE_SKILLS_DIR"

for s in "${SKILL_NAMES[@]}"; do
  copy_skill_to "$TRAE_SKILLS_DIR" "$s"
  copy_skill_to "$CLAUDE_SKILLS_DIR" "$s"
done

install_commands
install_template

echo
echo "Installed skills:"
echo "  Trae:   $TRAE_SKILLS_DIR/<skill>/SKILL.md"
echo "  Claude: $CLAUDE_SKILLS_DIR/<skill>/SKILL.md"
echo
echo "Installed commands:"
echo "  Trae:   $TRAE_COMMANDS_DIR/*.md"
echo "  Claude: $CLAUDE_COMMANDS_DIR/*.md"
echo
if [[ "$WITH_OPENSPEC_TEMPLATE" == "--with-openspec-template" ]]; then
  echo "Installed openspec template:"
  echo "  $TARGET_ROOT/openspec"
fi

cat <<EOF

Next steps:
  1. Restart or reload your agent host if it caches local skills or commands.
  2. Try:
     - openspec:plan <idea>
     - openspec:status <change-name>
     - openspec:apply <change-name>

Usage:
  ./install-all.sh /path/to/target-project
  ./install-all.sh /path/to/target-project --with-openspec-template
EOF
