#!/usr/bin/env bash
set -euo pipefail

DATE=$(date "+%Y-%m-%d_%H_%M_%S")

echo "$DATE" >VERSION

# Recompute SHA
TAR_URL="https://github.com/danshumaker/homebrew-denver/archive/refs/tags/v${DATE}.tar.gz"
SHA=$(curl -L "$TAR_URL" | shasum -a 256 | awk '{print $1}')

sed -i.bak "s/sha256 \".*\"/sha256 \"${SHA}\"/" Formula/denver.rb
rm Formula/denver.rb.bak

git add VERSION Formula/denver.rb
git commit -m "Bump version to ${DATE}"
git tag "${DATE}"
git push origin main --tags
