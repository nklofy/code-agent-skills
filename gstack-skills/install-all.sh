#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
SOURCE_ROOT="${SCRIPT_DIR}"

INSTALL_MODE="symlink"
INCLUDE_PROJECT_CLAUDE="false"

TRAE_TARGET="${REPO_ROOT}/.trae/skills"
CLAUDE_GLOBAL_TARGET="${HOME}/.claude/skills"
CLAUDE_PROJECT_TARGET="${REPO_ROOT}/.claude/skills"

SKILLS=(
  "mini-gstack"
  "gstack-office-hours"
  "gstack-task-planner"
  "gstack-engineering-workflow"
  "gstack-task-reviewer"
  "gstack-bug-investigator"
)

usage() {
  cat <<'EOF'
Usage: ./out-skills/install-all.sh [options]

Installs the out-skills suite into:
  - Trae project skills: ./.trae/skills
  - Claude global skills: ~/.claude/skills

For lower-cost usage, you can primarily use `mini-gstack` after install.

Options:
  --copy                    Copy files instead of creating symlinks
  --include-project-claude  Also install into ./.claude/skills
  --help                    Show this help text
EOF
}

log() {
  printf '[out-skills] %s\n' "$1"
}

ensure_dir() {
  mkdir -p "$1"
}

install_one() {
  local src="$1"
  local dest="$2"

  rm -rf "$dest"

  if [[ "$INSTALL_MODE" == "copy" ]]; then
    cp -R "$src" "$dest"
  else
    ln -s "$src" "$dest"
  fi
}

verify_source() {
  local skill
  for skill in "${SKILLS[@]}"; do
    if [[ ! -f "${SOURCE_ROOT}/${skill}/SKILL.md" ]]; then
      printf 'Missing source skill: %s\n' "${SOURCE_ROOT}/${skill}/SKILL.md" >&2
      exit 1
    fi
  done

  if [[ ! -f "${SOURCE_ROOT}/MANIFEST.md" ]]; then
    printf 'Missing manifest: %s\n' "${SOURCE_ROOT}/MANIFEST.md" >&2
    exit 1
  fi
}

install_target_group() {
  local target_root="$1"
  local label="$2"
  local skill

  ensure_dir "$target_root"
  log "Installing to ${label}: ${target_root}"

  for skill in "${SKILLS[@]}"; do
    install_one "${SOURCE_ROOT}/${skill}" "${target_root}/${skill}"
  done
}

for arg in "$@"; do
  case "$arg" in
    --copy)
      INSTALL_MODE="copy"
      ;;
    --include-project-claude)
      INCLUDE_PROJECT_CLAUDE="true"
      ;;
    --help)
      usage
      exit 0
      ;;
    *)
      printf 'Unknown argument: %s\n\n' "$arg" >&2
      usage >&2
      exit 1
      ;;
  esac
done

verify_source

log "Source root: ${SOURCE_ROOT}"
log "Install mode: ${INSTALL_MODE}"

install_target_group "$TRAE_TARGET" "Trae project"
install_target_group "$CLAUDE_GLOBAL_TARGET" "Claude global"

if [[ "$INCLUDE_PROJECT_CLAUDE" == "true" ]]; then
  install_target_group "$CLAUDE_PROJECT_TARGET" "Claude project"
fi

log "Installed skills:"
for skill in "${SKILLS[@]}"; do
  printf '  - %s\n' "$skill"
done

log "Lowest-cost starting point: mini-gstack"
log "Done."