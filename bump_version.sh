#!/usr/bin/env bash
set -euo pipefail

DATE=$(date "+%Y-%m-%d_%H_%M_%S")

git fetch origin main --tags
git rebase origin/main

echo "$DATE" >VERSION

SED="$(command -v gsed || command -v sed)"
"$SED" -i.bak -e "s/^  version \".*\"$/  version \"${DATE}\"/" Formula/denver.rb
rm -f Formula/denver.rb.bak

git add VERSION Formula/denver.rb

# Optional: avoid failing when nothing changed
if git diff --cached --quiet; then
  echo "No changes to commit."
  exit 0
fi

git commit -m "Bump version to ${DATE}"

# Do NOT force tags. Fail if tag already exists.
git tag "${DATE}"

# Push branch (force-with-lease is fine because you rebased)
git push --force-with-lease origin main

# Push the new tag (no force)
git push origin "${DATE}"
