#!/usr/bin/env bash
# Update canonical service-prototyping-skills files in a project.
# Overwrites: scope.md, doc-density.md, done.md, api-discovery/SKILL.md.
# Never touches templates (TODO/DONE/DECISIONS/DEFERRED). Diffs DENSITY_BUDGET.md.
# Usage: update.sh [target_directory]   (default: current directory)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET="${1:-$PWD}"

if [[ ! -d "$TARGET" ]]; then
  echo "Error: target directory '$TARGET' does not exist" >&2
  exit 1
fi

cd "$TARGET"

echo "Updating service-prototyping-skills in $TARGET"
echo "(If your project is not under version control, back up first.)"
echo

mkdir -p .claude/rules .claude/commands skills/api-discovery

update_file() {
  local src="$1" dst="$2"
  if [[ -f "$dst" ]] && cmp -s "$src" "$dst"; then
    echo "  same    $dst"
  elif [[ -f "$dst" ]]; then
    cp "$src" "$dst"
    echo "  updated $dst"
  else
    cp "$src" "$dst"
    echo "  added   $dst (was missing)"
  fi
}

update_file "$SCRIPT_DIR/.claude/rules/scope.md"        ".claude/rules/scope.md"
update_file "$SCRIPT_DIR/.claude/rules/doc-density.md"  ".claude/rules/doc-density.md"
update_file "$SCRIPT_DIR/.claude/commands/done.md"      ".claude/commands/done.md"
update_file "$SCRIPT_DIR/skills/api-discovery/SKILL.md" "skills/api-discovery/SKILL.md"

echo
echo "Templates were not touched (they may contain project-specific content)."

if [[ -f "DENSITY_BUDGET.md" ]] && ! cmp -s "$SCRIPT_DIR/templates/DENSITY_BUDGET.md" "DENSITY_BUDGET.md"; then
  echo
  echo "Note: DENSITY_BUDGET.md differs from the framework default. Diff:"
  echo "----"
  diff "$SCRIPT_DIR/templates/DENSITY_BUDGET.md" "DENSITY_BUDGET.md" || true
  echo "----"
  echo "Review and merge manually if you want to take new defaults."
fi
