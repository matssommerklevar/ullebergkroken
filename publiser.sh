#!/bin/bash
set -e
cd "$(dirname "$0")"
git pull --rebase --autostash --quiet
if [ -z "$(git status --porcelain)" ]; then echo "Ingen endringer å publisere."; exit 0; fi
echo "Endringer:"; git status --short
git add -A
git commit --quiet -m "${1:-Oppdatering $(date '+%d.%m.%Y %H:%M')}"
git push --quiet
echo "✓ Publisert. Oppdatert på https://www.ullebergkroken.no om 1–2 minutter."
