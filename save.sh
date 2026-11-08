#!/bin/bash
# Save and publish the aross.studio site.
# Usage: ./save.sh "what you changed"
set -e
cd "$(dirname "$0")"

MSG="${1:-update site}"
if [ -z "$(git status --porcelain)" ]; then
  echo "Nothing changed. Edit a file in public/root/ first."
  exit 0
fi

git add -A
git commit -q -m "$MSG"
git push -q origin main
echo "Pushed: $MSG"
echo "Live in about 2 minutes at https://aross.studio"
git log --oneline -1
