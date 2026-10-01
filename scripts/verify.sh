#!/bin/bash
# Purpose: Optional read-only verification of the final project layout.
# This script does not modify the lab.

set -u

PROJECT="$HOME/project"

if [[ ! -d "$PROJECT" ]]; then
    echo "ERROR: $PROJECT does not exist."
    exit 1
fi

echo "=== Project tree ==="
if command -v tree >/dev/null 2>&1; then
    tree "$PROJECT"
else
    echo "tree is not installed; use: sudo apt install tree"
fi

echo
echo "=== Directory listings ==="
for dir in "$PROJECT/docs" "$PROJECT/scripts" "$PROJECT/bin" "$PROJECT/backup"; do
    echo
    echo "--- $dir ---"
    if [[ -d "$dir" ]]; then
        ls -la "$dir"
    else
        echo "Directory missing."
    fi
done

echo
echo "=== File content checks ==="

if [[ -f "$PROJECT/docs/report.txt" ]]; then
    echo "--- docs/report.txt ---"
    cat "$PROJECT/docs/report.txt"
else
    echo "docs/report.txt is missing."
fi

if [[ -f "$PROJECT/scripts/install.sh" ]]; then
    echo
    echo "--- scripts/install.sh ---"
    cat "$PROJECT/scripts/install.sh"
else
    echo "scripts/install.sh is missing."
fi

echo
echo "Verification complete. Review the output against the task requirements."
