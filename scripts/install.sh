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

# Capture pre-state so the closing message can differentiate fresh-install
# from overlay-on-existing-project.
claude_md_existed_before=false
[[ -f "CLAUDE.md" ]] && claude_md_existed_before=true

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
copy_if_missing "$SCRIPT_DIR/.claude/commands/sp-done.md"      ".claude/commands/sp-done.md"
copy_if_missing "$SCRIPT_DIR/skills/api-discovery/SKILL.md" "skills/api-discovery/SKILL.md"

for f in CLAUDE.md DENSITY_BUDGET.md DECISIONS.md DEFERRED.md TODO.md DONE.md; do
  copy_if_missing "$SCRIPT_DIR/templates/$f" "$f"
done

echo
echo "Done."
echo

if [[ "$claude_md_existed_before" == "true" ]]; then
  cat <<'EOF'
Your existing CLAUDE.md was preserved. Make sure it imports the rules:

  @.claude/rules/scope.md
  @.claude/rules/doc-density.md
  @DENSITY_BUDGET.md

(See templates/CLAUDE.md in this repo for the full skeleton.)
EOF
else
  echo "Next: open CLAUDE.md and fill in the TODO slots (spec path, build commands)."
fi

if ! git rev-parse --git-dir >/dev/null 2>&1; then
  echo
  echo "This directory is not yet a git repository. To initialize:"
  echo "  git init && git add . && git commit -m 'Initial commit: service-prototyping-skills'"
fi
