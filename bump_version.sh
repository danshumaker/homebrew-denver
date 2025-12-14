#!/usr/bin/env bash
set -euo pipefail

DATE=$(date "+%Y-%m-%d_%H_%M_%S")

echo "$DATE" >VERSION

sed -i "s/version \".*\"/version \"${DATE}\"/" Formula/denver.rb

git fetch origin main
git rebase origin/main
git add VERSION Formula/denver.rb
git commit -m "Bump version to ${DATE}"
git tag -f "${DATE}"
git push --force-with-lease origin main --tags
