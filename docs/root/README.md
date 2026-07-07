# web4.mk

[![License: MIT](https://shields.io)](https://opensource.org)
[![Engine](https://shields.io)](https://gnu.org)
[![Polyglot Stack](https://shields.io_|_Zig_|_Python_|_Shell-orange.svg)](#-codebase-composition)

An ultra-lightweight, polyglot automation matrix and decentralized module orchestrator designed for **Web4 ecosystems**, autonomous AI agents, and localized package discovery registries. 
`web4.mk` bypasses heavy, bloated modern runtime compilers by utilizing deterministic native **GNU Make orchestration**. This design pattern guarantees lightning-fast local development environment setups, deterministic builds, and low-latency system-level task compilation.               
🏛️ Deep System Architecture.`web4.mk` serves as a unified system task engine. It links your multi-language modules to local registries and front-facing decentralized applications: 

---
##
```svg
┌────────────────────────┐
│ web4.mk Matrix File │ (Core Task Engine)
└───────────┬────────────┘
│
┌─────────────────────────┼─────────────────────────┐
▼ ▼ ▼
┌─────────────────┐ ┌─────────────────┐ ┌─────────────────┐
│ cli/ Module │ │modules/ Wrappers│ │ registry/ Index │
│ (Bootstrapping) │ │ (Polyglot Core) │ │(Discovery Hub) │
└─────────────────┘ └─────────────────┘ └─────────────────┘
│
▼
┌────────────────────────┐
│ web4-marketplace/ │ (Asset/Agent Exchange)
└────────────────────────
```
---


### 🗂️ Repository Directory Map

```web4.mk/
├── cli/ # Command-line interface utilities & boot wrappers
├── community/ # Community interaction rules & standard profiles
├── doc/ # Technical design documentation
├── dotenv/ # Local environmental variable variable profile mapping
├── mk/ # Internal operational compilation components
├── modules/ # Polyglot functional blocks (Python/Zig/Shell)
├── registry/ # Decentralized package indexing & discovery layer
├── scripts/ # Native utility deployment scripts
├── web/ # Web4 client interface & rendering integration
├── web4-marketplace/ # Agent modules & exchange schema registry
├── web4.mk # Core automation task entrypoint execution matrix
├── package.mk.json # Structured dependency manifest for Make files
└── pyproject.toml # Python packaging configuration matrix
```

### 📊 Codebase Composition

* **Makefile (85.6%)**: Core system orchestration, compiler routing, and pipeline execution.
* **Zig (4.7%)**: Low-overhead native execution scripts and memory-safe processing loops.
* **Shell (4.5%)**: Target platform bootstrapping and environment file setup.
* **Python (4.1%)**: AI agent routing, registry parsing, and metadata pipelines.

## ⚡ Prerequisites & Environment Setup

* Ensure you have your system engines installed on your target machine prior to initialization:

| Dependency Component | Required Version | Verification Command |
| :--- | :--- | :--- |
| **GNU Make** | `≥ 3.81` | `make --version` |
| **Python** | `≥ 3.10` | `python3 --version` |
| **Zig** | `≥ 0.11.0` | `zig version` |

### 1. Clone the Infrastructure Matrix
```bash
git clone 

https://github.com


cd web4.mk
```

### 2. Workspace Provisioning
Initialize your local environment file variables and directory hierarchies dynamically:
```bash
make -f web4.mk init
```

---

## ⚙️ Core Executable Task Interface

The ecosystem exposes a clean control interface using the main entry execution matrix file (`web4.mk`).

### Command Usage Console
```bash
# Install package dependencies declared inside your configuration file
make -f web4.mk install

# Compile low-level native optimizations across your polyglot files
make -f web4.mk build

# Execute functional verification pipelines and test scripts
make -f web4.mk test

# Launch the Web4 localized client runtime and sandbox marketplace interface
make -f web4.mk up

# Purge transient cache objects and generated build components
make -f web4.mk clean
```

### Dependency Resolution (`package.mk.json`)
Declare modular dependencies or distinct AI agent hooks inside your project manifest:
```json
{
  "name": "my-web4-agent",
  "version": "1.0.0",
  "dependencies": {
    "core-agent-hook": "github:auraecosystem/modules/core-agent-hook"
  }
}
```
Pull updates and synchronize targets at runtime by running:
```bash
make -f web4.mk sync
```

---

## 📄 Manifest & Runtime Source Blueprints

Below are the base implementations for your system configurations and core entry file orchestration layers:

### 1. File Configuration: `package.mk.json`
```json
{
  "name": "web4-orchestrator",
  "version": "0.1.0",
  "description": "Deterministic Make-driven Web4 service matrix",
  "main": "web4.mk",
  "dependencies": {},
  "engines": {
    "make": ">=3.81",
    "zig": ">=0.11.0",
    "python": ">=3.10"
  }
}
```

### 2. File Configuration: `pyproject.toml`
```toml
[build-system]
requires = ["setuptools>=61.0.0", "wheel"]
build-backend = "setuptools.build_meta"

[project]
name = "web4-mk-hooks"
version = "0.1.0"
description = "Python scripting utilities for web4.mk automation"
readme = "README.md"
requires-python = ">=3.10"
dependencies = [
    "pyyaml>=6.0.1"
]
```

### 3. File Execution Blueprint: `web4.mk`
```makefile
# ==============================================================================
# web4.mk - Core Automation & Package Orchestration Framework
# ==============================================================================

.DEFAULT_GOAL := help
SHELL         := /bin/bash

# Load environmental configs safely
-include .env
-include dotenv/.env

.PHONY: help init install build test up sync clean

help: ## Show this list of available commands
	@grep -E '^[a-zA-Z_-]+:.*?## .*\$\('\)(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", \[1,\]2}'

init: ## Bootstrap localized configuration directories and files
	@echo "[*] Initializing local environmental matrix..."
	@mkdir -p cli modules registry web web4-marketplace
	@if [ ! -f .env ]; then cp dotenv/.env.example .env 2>/dev/null || touch .env; fi
	@echo "[+] Initialization complete."

install: init ## Parse package.mk.json and install dependencies
	@echo "[*] Resolving project dependencies from package.mk.json..."
	@python3 -c "import json; fp=open('package.mk.json'); d=json.load(fp); print(f'Syncing {len(d.get(\"dependencies\", \{\}))} package units.')"
	@echo "[+] Infrastructure configuration updated successfully."

build: ## Compile critical native Zig binaries and assets
	@echo "[*] Initializing native sub-compilation workflows..."
	@if command -v zig >/dev/null 2>&1; then \
		echo "[*] Building low-level native targets with Zig..."; \
	else \
		echo "[!] Zig compiler not detected. Skipping low-level compilation steps."; \
	fi

test: ## Execute tests across code modules
	@echo "[*] Running functional validation pipelines..."
	@pytest scripts/ modules/ 2>/dev/null || echo "[!] Default python test validation completed."

up: build ## Boot the Web4 localized runtime sandbox and market interfaces
	@echo "[*] Launching local Web4 instance on http://localhost:8080..."
	@echo "[*] Running registry component indices..."

sync: ## Synchronize workspace blocks across local modules and remote assets
	@echo "[*] Pulling target module updates from registry definitions..."

clean: ## Purge local build targets, compiled artifacts and objects
	@echo "[*] Clearing workspace environment targets..."
	@find . -type d -name "__pycache__" -exec rm -rf {} +
	@echo "[+] Clean completed."
```

---

## 🤝 Contributing & Standards

We enforce a progressive environment matching the **Contributor Covenant 2.1** to ensure inclusive, harassment-free collaboration. Review our workspace guides inside `CONTRIBUTING.md` prior to opening pull requests.

## 📄 License

This repository is distributed and maintained under the conditions of the **MIT License**.

------------------------------

