# web4.mk 🚀

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Make >=3.81](https://img.shields.io/badge/Make-%3E%3D3.81-blue.svg)](https://www.gnu.org/software/make/)
[![Python >=3.10](https://img.shields.io/badge/Python-%3E%3D3.10-blue.svg)](https://www.python.org/)
[![Zig >=0.11.0](https://img.shields.io/badge/Zig-%3E%3D0.11.0-orange.svg)](https://ziglang.org/)

An ultra-lightweight, polyglot automation matrix and decentralized module orchestrator designed for Web4 ecosystems.

## Table of Contents
- [Prerequisites](#-prerequisites)
- [Quick Start](#-quick-start)
- [Core Commands](#-core-commands)
- [Example module](#example-module)
- [Examples & docs](#examples--docs)
- [Windows (WSL) Setup](#-windows-wsl-setup)
- [Contributing](#contributing)
- [Troubleshooting](#troubleshooting)
- [License](#-license)

## 🛠️ Prerequisites
Install these tools before using web4.mk:
- GNU Make (>= 3.81)
- Python (>= 3.10)
- Zig Compiler (>= 0.11.0) — optional (only for native targets)

Quick install (Debian/Ubuntu):
```bash
sudo apt update
sudo apt install -y make python3 python3-venv
# Optional: install Zig from https://ziglang.org/download/
```

Verify installation:
```bash
make --version
python3 --version
zig version   # optional
```

## 🚀 Quick Start
Clone and run the core workflow:
```bash
git clone https://github.com/auraecosystem/web4.mk.git
cd web4.mk

# initialize directories and default layout
make -f web4.mk init

# (optional) build native targets (requires Zig)
make -f web4.mk build

# start the local Web4 sandbox
make -f web4.mk up
```

Notes:
- `init` creates the directory structure (for example `cli/` and `modules/`).
- `build` compiles native artifacts via Zig — skip if you don't use native targets.
- `up` starts a local sandbox environment for running modules.

## ⚙️ Core Commands

| Command | Action |
| :--- | :--- |
| `make -f web4.mk init` | Initializes directories and scaffolding (`/cli`, `/modules`) |
| `make -f web4.mk build` | Compiles native targets (Zig) |
| `make -f web4.mk up` | Starts the local Web4 sandbox |
| `make -f web4.mk test` | Runs project tests (if configured) |

(You can run `make -n -f web4.mk <target>` to preview what a target will do.)

## Example module
A minimal module layout and invocation example.

Directory layout:
```
modules/
  hello/
    module.mk
    main.py
```

modules/hello/module.mk
```make
NAME := hello
.PHONY: run

run:
	@echo "Running ${NAME} module..."
	python3 main.py
```

modules/hello/main.py
```python
print("Hello from web4.mk module!")
```

To run:
```bash
# from repo root
make -f web4.mk module MODULE=hello RUN=run
# or cd modules/hello && make -f module.mk run
```

Adjust the `make` invocation to match your repo's module dispatch rules — `module` target is an example; consult `web4.mk` for exact parameter names.

## Examples & docs
See `examples/` for sample modules and documentation:
- examples/docs/llms.wiki
- llms-full.txt

These contain sample module designs and configuration patterns for integrating LLM-driven workflows.

## 🪟 Windows (WSL) Setup
On Windows use WSL for a Unix-like development environment.

1. In PowerShell (Admin):
```powershell
wsl --install
```
2. Open your WSL distro and install dependencies:
```bash
sudo apt update && sudo apt install -y build-essential python3 python3-venv
```
3. Run the make commands from within WSL (not PowerShell).

## Contributing
Contributions welcome! Suggested workflow:
1. Fork the repo.
2. Create a branch: `git checkout -b feat/your-feature`.
3. Make changes and commit with descriptive messages.
4. Open a Pull Request describing the change and motivation.

Consider adding:
- CONTRIBUTING.md with contribution guidelines
- CODE_OF_CONDUCT.md
- Tests for new features

Be explicit about compatibility and supported tool versions when adding modules.

## Troubleshooting
- Make errors: check `make --version` and ensure GNU Make >= 3.81.
- Python errors: create and activate a venv:
  ```bash
  python3 -m venv .venv
  source .venv/bin/activate
  pip install -r requirements.txt  # if provided
  ```
- Zig build failures: confirm `zig version` and adjust build scripts to the installed Zig release.
- Permission issues: ensure files in `cli/` or `modules/` are executable if required (`chmod +x`).

If something still fails, run the failing command with `-x` or `--debug` (where supported) and open an issue with the command output.

## License
This project is licensed under the MIT License. See [LICENSE](./LICENSE) for details.

---

Maintainers: auraecosystem
Contact / Issues: https://github.com/auraecosystem/web4.mk/issues
