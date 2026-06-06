---
name: image-generation
description: Use when generating, editing, routing, packaging, or troubleshooting images for Codex. Covers local ComfyUI drawing, OpenAI/GPT-5.5 image generation, explicit route selection, QQ image delivery, output storage, service wrappers, model/output boundaries, and reusable image-generation setup in the local Codex extensions repository.
---

# Image Generation

Use this skill when the user asks Codex to draw, generate an image, choose between local and OpenAI image routes, send generated images to QQ, or package image generation for reuse.

## Route Choice

Keep local and OpenAI routes available at the same time.

- Use `${CODEX_HOME:-$HOME/.codex}/bin/codex-draw` for explicit local, ComfyUI, free, offline, draft, repeatable, or quick local image requests.
- Use `${CODEX_HOME:-$HOME/.codex}/bin/codex-openai-draw` for explicit OpenAI, GPT-5.5, 5.5, official, high-quality, strong prompt-following, text-rendering, or complex image requests.
- Use `${CODEX_HOME:-$HOME/.codex}/bin/codex-55-draw` as the short explicit GPT-5.5 image route.
- Add `--qq --qq-message "..."` when the user wants the generated image sent over QQ.

Read `references/routes.md` for service paths, env vars, and packaging details.

## Local ComfyUI

Start and inspect the service:

```bash
${CODEX_HOME:-$HOME/.codex}/bin/codex-image-gen-up
${CODEX_HOME:-$HOME/.codex}/bin/codex-image-gen-health
${CODEX_HOME:-$HOME/.codex}/bin/codex-image-gen-logs
```

Generate locally:

```bash
${CODEX_HOME:-$HOME/.codex}/bin/codex-draw "prompt" --prefix codex
```

Local outputs belong under `${CODEX_IMAGE_GEN_OUTPUT_DIR:-$CODEX_SERVER_ROOT/image-gen/outputs}`.

## OpenAI / GPT-5.5

Generate with GPT-5.5:

```bash
${CODEX_HOME:-$HOME/.codex}/bin/codex-55-draw "prompt" --quality high --size 1024x1536
```

Generate with the full OpenAI wrapper:

```bash
${CODEX_HOME:-$HOME/.codex}/bin/codex-openai-draw "prompt" --api responses --metadata
```

OpenAI outputs belong under `${CODEX_OPENAI_IMAGE_OUTPUT_DIR:-$CODEX_SERVER_ROOT/image-gen/openai-outputs}`. Use `OPENAI_API_KEY`, `CODEX_OPENAI_API_KEY_FILE`, or the local Codex auth file; do not commit secrets.

## QQ Delivery

Generate and send:

```bash
${CODEX_HOME:-$HOME/.codex}/bin/codex-draw "prompt" --qq --qq-message "图片好了"
```

Send an existing image:

```bash
${CODEX_HOME:-$HOME/.codex}/bin/codex-qq-notify-image /absolute/path/image.png "图片好了"
```

The AstrBot OpenAPI key needs `im` and `file` scopes.

## Packaging Rules

- Keep wrappers, route docs, and skills in `${CODEX_HOME}`.
- Keep ComfyUI, models, virtualenvs, logs, and generated images under `${CODEX_SERVER_ROOT}/image-gen`.
- Do not commit model checkpoints, generated images, API keys, or OpenAI auth files.
- Make path defaults configurable with `CODEX_SERVER_ROOT`, `CODEX_IMAGE_GEN_HOME`, `CODEX_IMAGE_GEN_OUTPUT_DIR`, and `CODEX_OPENAI_IMAGE_OUTPUT_DIR`.

## Checks

Run the bundled check before committing route changes:

```bash
${CODEX_HOME:-$HOME/.codex}/skills/image-generation/scripts/check-image-routes.sh
```

For code changes, also run syntax checks on edited wrappers and a tracked-file secret scan.
