#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CODEX_HOME="${CODEX_HOME:-$(cd "${SCRIPT_DIR}/../../.." && pwd)}"
SERVER_ROOT="${CODEX_SERVER_ROOT:-${HOME}/.codex/servers}"
IMAGE_HOME="${CODEX_IMAGE_GEN_HOME:-${SERVER_ROOT}/image-gen}"

required=(
  "$CODEX_HOME/bin/codex-draw"
  "$CODEX_HOME/bin/codex-openai-draw"
  "$CODEX_HOME/bin/codex-55-draw"
  "$CODEX_HOME/bin/codex-image-gen-up"
  "$CODEX_HOME/bin/codex-image-gen-health"
  "$CODEX_HOME/bin/codex-qq-notify-image"
)

for path in "${required[@]}"; do
  if [[ ! -x "$path" ]]; then
    echo "missing executable: $path" >&2
    exit 1
  fi
done

mkdir -p "$IMAGE_HOME/outputs" "$IMAGE_HOME/openai-outputs" "$IMAGE_HOME/logs"
"$CODEX_HOME/bin/codex-openai-draw" "route check" --dry-run >/dev/null

if curl -fsS "${CODEX_IMAGE_GEN_URL:-http://127.0.0.1:8188}/system_stats" >/dev/null 2>&1; then
  echo "local ComfyUI: healthy"
else
  echo "local ComfyUI: not running"
fi

echo "image routes ok"
