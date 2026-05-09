#!/usr/bin/env bash
# Install service-prototyping-skills into a project.
# Copies missing files; never overwrites existing ones. Safe to re-run.
# Usage: install.sh [target_directory]   (default: current directory)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET="${1:-$PWD}"

if [[ ! -d "$TARGET" ]]; then
  echo "Error: target directory '$TARGET' does not exist" >&2
  exit 1
fi

cd "$TARGET"

echo "Installing service-prototyping-skills into $TARGET"
echo

mkdir -p .claude/rules .claude/commands skills/api-discovery

copy_if_missing() {
  local src="$1" dst="$2"
  if [[ -f "$dst" ]]; then
    echo "  skip  $dst (already exists)"
  else
    cp "$src" "$dst"
    echo "  add   $dst"
  fi
}

copy_if_missing "$SCRIPT_DIR/.claude/rules/scope.md"        ".claude/rules/scope.md"
copy_if_missing "$SCRIPT_DIR/.claude/rules/doc-density.md"  ".claude/rules/doc-density.md"
copy_if_missing "$SCRIPT_DIR/.claude/commands/done.md"      ".claude/commands/done.md"
copy_if_missing "$SCRIPT_DIR/skills/api-discovery/SKILL.md" "skills/api-discovery/SKILL.md"

for f in DENSITY_BUDGET.md DECISIONS.md DEFERRED.md TODO.md DONE.md; do
  copy_if_missing "$SCRIPT_DIR/templates/$f" "$f"
done

cat <<'EOF'

Done. If your CLAUDE.md does not already point at the rules, add this block:

  Before any work, read:
  - .claude/rules/scope.md — scope discipline
  - .claude/rules/doc-density.md — doc length and prose
  - DENSITY_BUDGET.md — per-project length caps
  - DECISIONS.md and DEFERRED.md — running logs
EOF
