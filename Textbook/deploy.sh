#!/usr/bin/env bash
#
# Upload the contents of ./book to gancherj/Lait-Site (main).
# The remote branch is overwritten with exactly what's in book/.

set -euo pipefail

REPO="gancherj/Lait-Site"
BRANCH="main"
BOOK_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/book" && pwd)"

STAGE="$(mktemp -d)"
trap 'rm -rf "$STAGE"' EXIT

cp -R "$BOOK_DIR/." "$STAGE/"

git -C "$STAGE" init -q -b "$BRANCH"
git -C "$STAGE" add -A
git -C "$STAGE" commit -q -m "Deploy book"
git -C "$STAGE" push --force "$(gh repo view "$REPO" --json url -q .url).git" "$BRANCH"

echo "pushed to $REPO ($BRANCH)"
