# Image Route Reference

## Storage

```text
CODEX_HOME=/Volumes/ssd/work/.codex
CODEX_SERVER_ROOT=/Volumes/ssd/servers
CODEX_IMAGE_GEN_HOME=/Volumes/ssd/servers/image-gen
COMFYUI_HOME=/Volumes/ssd/servers/image-gen/ComfyUI
COMFYUI_PYTHON=/Volumes/ssd/servers/image-gen/.venv/bin/python
CODEX_IMAGE_GEN_OUTPUT_DIR=/Volumes/ssd/servers/image-gen/outputs
CODEX_OPENAI_IMAGE_OUTPUT_DIR=/Volumes/ssd/servers/image-gen/openai-outputs
```

Repository files contain wrappers and docs only. Runtime data stays under `servers`.

## Local Route

Commands:

```bash
codex-image-gen-up
codex-image-gen-health
codex-image-gen-logs
codex-image-gen-down
codex-draw "prompt" --width 512 --height 512 --steps 20
```

`codex-draw` talks to ComfyUI's HTTP API at `CODEX_IMAGE_GEN_URL` or `http://127.0.0.1:8188`.

## OpenAI Route

Commands:

```bash
codex-openai-draw "prompt" --api responses --main-model gpt-5.5
codex-openai-draw "prompt" --api images --image-model gpt-image-2
codex-55-draw "prompt"
```

Useful options:

- `--quality low|medium|high|auto`
- `--size 1024x1024|1024x1536|1536x1024`
- `--output-format png|jpeg|webp`
- `--metadata`
- `--qq --qq-message "..."`

Secrets:

- Prefer `OPENAI_API_KEY` or `CODEX_OPENAI_API_KEY_FILE`.
- The wrapper may read `~/.codex/auth.json` if present.
- Never write API keys into generated metadata, committed docs, or logs meant for users.

## QQ Delivery

`codex-qq-notify-image` uploads the local file to AstrBot OpenAPI `/api/v1/file`, then sends the returned `attachment_id` through `/api/v1/im/message`.

Required environment:

```text
ASTRBOT_URL=http://127.0.0.1:6185
ASTRBOT_OPENAPI_KEY_FILE=/Volumes/ssd/servers/astrbot/data/codex_openapi_im.key
CODEX_QQ_NOTIFY_UMO=<AstrBot unified message origin>
```

## Commit Checklist

- [ ] No generated images staged.
- [ ] No model checkpoints, ComfyUI output folders, or virtualenvs staged.
- [ ] `codex-openai-draw --dry-run "test"` works.
- [ ] `codex-image-gen-health` works when local generation is expected.
- [ ] Secret scan finds no API keys or tokens in tracked files.
