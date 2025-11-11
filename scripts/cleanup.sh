#!/usr/bin/env bash
set -euo pipefail
echo "Running generic cleanup..."
bash modules/day10_troubleshooting_cleanup.md 2>/dev/null || true
echo "Review resources in console to confirm deletion."
