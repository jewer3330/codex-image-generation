# Change Log

## 0.1.0

- Split image generation into a standalone development source project.
- Packaged local ComfyUI generation, OpenAI/GPT-5.5 generation, QQ image
  notification, service wrappers, and the `image-generation` skill.
- Documented dependencies, model/output boundaries, and configurable paths.
- Added install and check scripts so this source tree can promote its files into
  a local `.codex` installation.
- Made default install and runtime paths portable: `CODEX_HOME` defaults to
  `$HOME/.codex`, and `CODEX_SERVER_ROOT` defaults to `$HOME/.codex/servers`.
- Added a PowerShell installer for Windows file installation.
- Installers now copy the full plugin source into
  `.codex/plugins/codex-image-generation` and register it in the personal Codex
  marketplace.
- Made install lightweight: ComfyUI runtime directories are created by service
  setup/start commands, not by the base plugin installer.
