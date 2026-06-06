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

macOS/Linux/WSL/Git Bash:

```bash
scripts/install-to-codex.sh
```

Windows PowerShell:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/install-to-codex.ps1
```

The install script is lightweight: it copies source-controlled wrappers, skills,
plugin source, and marketplace metadata. It does not install ComfyUI, require
Docker, download models, or create service runtime data by default.

When you enable the local ComfyUI route, runtime ComfyUI files, models, logs,
and generated images stay under
`${CODEX_SERVER_ROOT:-$HOME/.codex/servers}/image-gen` or your
`CODEX_IMAGE_GEN_HOME` override.

To use another disk or service root:

```bash
CODEX_HOME=/opt/codex \
CODEX_SERVER_ROOT=/srv/codex \
scripts/install-to-codex.sh
```

The installer copies source-controlled files into `.codex/bin`,
`.codex/skills/image-generation`, `.codex/plugins/codex-image-generation`, and
the personal marketplace file.

## Marketplace

Install scripts register this plugin in the personal Codex marketplace at
`${CODEX_MARKETPLACE_FILE:-$CODEX_HOME/.agents/plugins/marketplace.json}` with
source path `./plugins/codex-image-generation`.

## Windows Notes

The Python image wrappers can run on Windows with Python 3.10+ and the needed
environment variables. The ComfyUI service management wrappers are Unix shell
scripts today, so use WSL/Git Bash for those until native PowerShell service
wrappers are added. Docker Desktop is optional and only relevant if you choose a
Docker-based ComfyUI deployment.

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
