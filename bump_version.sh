#!/usr/bin/env bash
set -euo pipefail

NEW="$1"
echo "$NEW" >VERSION

# Recompute SHA
TAR_URL="https://github.com/danshumaker/homebrew-shushop/archive/refs/tags/v${NEW}.tar.gz"
SHA=$(curl -L "$TAR_URL" | shasum -a 256 | awk '{print $1}')

sed -i.bak "s/sha256 \".*\"/sha256 \"${SHA}\"/" Formula/shushop.rb
rm Formula/shushop.rb.bak

git add VERSION Formula/shushop.rb
git commit -m "Bump version to v${NEW}"
git tag "v${NEW}"
git push origin main --tags
