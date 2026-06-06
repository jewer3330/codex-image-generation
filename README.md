# Codex Image Generation

This is the development source project for Codex image generation routes.
It keeps editable source separate from installed `.codex/bin` wrappers and the
installed `.codex/skills/image-generation` skill.

## What Changed

- Added `codex-draw` for local ComfyUI generation through the ComfyUI HTTP API.
- Added `codex-openai-draw` for OpenAI image generation through the Responses
  API image tool or the Image API.
- Added `codex-55-draw` as the short GPT-5.5 image route.
- Added ComfyUI service wrappers for install, up, down, health, and logs.
- Added QQ image delivery support through `codex-qq-notify-image`.
- Added the reusable `image-generation` skill and route check script.
- Made output and service roots configurable through `CODEX_SERVER_ROOT`,
  `CODEX_IMAGE_GEN_HOME`, `CODEX_IMAGE_GEN_OUTPUT_DIR`, and
  `CODEX_OPENAI_IMAGE_OUTPUT_DIR`.

## Install

```bash
scripts/install-to-codex.sh
```

Runtime ComfyUI files, models, logs, and generated images stay under
`${CODEX_SERVER_ROOT:-$HOME/.codex/servers}/image-gen`.

To use another disk or service root:

```bash
CODEX_HOME=/opt/codex \
CODEX_SERVER_ROOT=/srv/codex \
scripts/install-to-codex.sh
```

## Check

```bash
scripts/check.sh
```

The check validates script syntax and the OpenAI dry-run path. It can also run
the installed skill health check when services are available.

## Runtime Data Boundary

Do not commit generated images, ComfyUI checkouts, model checkpoints, OpenAI
metadata with private prompts, API keys, or virtualenvs. Commit only wrappers,
skills, documentation, and installer logic.
