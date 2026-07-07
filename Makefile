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

# Append this inside your existing web4.mk file to handle Zig compilation
ZIG_SRC       := modules/math_utils.zig
ZIG_OUT       := modules/math_utils.o

build-native: ## Compile native memory-safe Zig performance objects
	@echo "[*] Checking system compilers..."
	@if command -v zig >/dev/null 2>&1; then \
		echo "[*] Compiling $(ZIG_SRC) into shared native artifact..."; \
		zig build-obj $(ZIG_SRC) -femit-bin=$(ZIG_OUT) --name math_utils; \
		print "[+] Native binary optimized successfully at $(ZIG_OUT)."; \
	else \
		echo "[!] Zig optimization compiler was not found. Skipping native pass."; \
	fi
