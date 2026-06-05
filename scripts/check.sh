#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

zsh -n \
  "${REPO_ROOT}/bin/codex-55-draw" \
  "${REPO_ROOT}/bin/codex-image-gen-up" \
  "${REPO_ROOT}/bin/codex-image-gen-down" \
  "${REPO_ROOT}/bin/codex-image-gen-health" \
  "${REPO_ROOT}/bin/codex-image-gen-logs" \
  "${REPO_ROOT}/bin/codex-image-gen-install" \
  "${REPO_ROOT}/bin/codex-image-gen-install-smoke-model" \
  "${REPO_ROOT}/bin/codex-qq-notify-image" \
  "${REPO_ROOT}/scripts/install-to-codex.sh" \
  "${REPO_ROOT}/skills/image-generation/scripts/check-image-routes.sh"

python3 -m py_compile \
  "${REPO_ROOT}/bin/codex-draw" \
  "${REPO_ROOT}/bin/codex-openai-draw"

"${REPO_ROOT}/bin/codex-openai-draw" "route check" --dry-run >/dev/null

echo "codex-image-generation checks ok"

