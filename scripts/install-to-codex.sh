#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CODEX_HOME="${CODEX_HOME:-/Volumes/ssd/work/.codex}"

mkdir -p "${CODEX_HOME}/bin" "${CODEX_HOME}/skills"

rsync -a "${REPO_ROOT}/bin/" "${CODEX_HOME}/bin/"
rsync -a --delete "${REPO_ROOT}/skills/image-generation/" "${CODEX_HOME}/skills/image-generation/"

chmod +x \
  "${CODEX_HOME}/bin/codex-draw" \
  "${CODEX_HOME}/bin/codex-openai-draw" \
  "${CODEX_HOME}/bin/codex-55-draw" \
  "${CODEX_HOME}/bin/codex-image-gen-up" \
  "${CODEX_HOME}/bin/codex-image-gen-down" \
  "${CODEX_HOME}/bin/codex-image-gen-health" \
  "${CODEX_HOME}/bin/codex-image-gen-logs" \
  "${CODEX_HOME}/bin/codex-image-gen-install" \
  "${CODEX_HOME}/bin/codex-image-gen-install-smoke-model" \
  "${CODEX_HOME}/bin/codex-qq-notify-image" \
  "${CODEX_HOME}/skills/image-generation/scripts/check-image-routes.sh"

echo "Installed Codex image generation source into ${CODEX_HOME}"

