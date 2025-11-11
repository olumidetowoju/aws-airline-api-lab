#!/usr/bin/env bash
set -euo pipefail
# Requires pandoc installed locally.
OUT="docs/SkyBridge-Airline-API-Lab.pdf"
mkdir -p docs
pandoc -s README.md modules/*.md -o "$OUT"
echo "Wrote $OUT"
