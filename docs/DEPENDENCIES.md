# Dependencies

## Runtime

- Python 3.10+ for the image route wrappers.
- `curl`, `screen`, `lsof`, `unzip`, and standard Unix shell tools for the macOS/Linux/WSL service wrappers.
- PowerShell 5+ or PowerShell 7+ for Windows installation.
- ComfyUI for the local image route.
- OpenAI API access for `codex-openai-draw` and `codex-55-draw`.
- Optional AstrBot OpenAPI with `im` and `file` scopes for QQ image delivery.

Docker is not required to install this plugin. It is only needed if you choose a
Docker-based ComfyUI runtime.

## Python Libraries

The primary wrappers use Python standard library modules only:

- `argparse`
- `base64`
- `json`
- `os`
- `subprocess`
- `sys`
- `time`
- `urllib`
- `uuid`
- `pathlib`

`codex-image-gen-install-smoke-model` uses:

- `huggingface_hub`

ComfyUI itself installs its upstream `requirements.txt` into the service venv
under `${CODEX_IMAGE_GEN_HOME:-$CODEX_SERVER_ROOT/image-gen}/.venv`.

## OpenAI Models

- Default Responses route: `gpt-5.5` with `image_generation`.
- Default Image API route: `gpt-image-2`.

These defaults can be overridden with `CODEX_OPENAI_IMAGE_MAIN_MODEL` and
`CODEX_OPENAI_IMAGE_MODEL`.
