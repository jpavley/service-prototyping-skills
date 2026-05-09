#!/usr/bin/env bash
# PostToolUse hook: warn when an edited file exceeds its line budget.
# Budgets defined in templates/DENSITY_BUDGET.md; rule in .claude/rules/doc-density.md.
# Exit 2 + stderr surfaces the warning to the model so the next turn splits the file.

set -euo pipefail

file_path=$(python3 -c '
import json, os, sys
p = json.load(sys.stdin).get("tool_input", {}).get("file_path", "")
print(os.path.realpath(p) if p else "")
')

[ -z "$file_path" ] && exit 0
[ ! -f "$file_path" ] && exit 0

# git --show-toplevel already returns a realpath on macOS (/tmp -> /private/tmp);
# realpath'ing file_path above keeps both ends in the same namespace so the strip works.
repo_root=$(git -C "$(dirname "$file_path")" rev-parse --show-toplevel 2>/dev/null || pwd)
rel_path="${file_path#"$repo_root"/}"

# Return the line budget for a repo-relative path, or empty string if unbudgeted.
# Mirrors the numerically-checkable rows of templates/DENSITY_BUDGET.md.
# Unbudgeted paths pass silently — adding a soft cap on all .md files would
# fight new docs in flight; the rule is "spec what you enforce, defer the rest."
budget_for_path() {
    local path="$1"
    case "$path" in
        CLAUDE.md)            echo 80  ;;
        .claude/rules/*.md)   echo 60  ;;
        skills/*/SKILL.md)    echo 200 ;;
        *) echo "" ;;
    esac
}

budget=$(budget_for_path "$rel_path")
[ -z "$budget" ] && exit 0

lines=$(wc -l < "$file_path" | tr -d ' ')

if [ "$lines" -gt "$budget" ]; then
    echo "DENSITY BUDGET: $rel_path is $lines lines (budget: $budget). Per .claude/rules/doc-density.md: split, do not compress prose." >&2
    exit 2
fi
