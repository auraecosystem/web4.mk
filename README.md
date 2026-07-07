# web4.mk 🚀

[![License: MIT](https://shields.io)](https://opensource.org)
 [![Make](https://shields.io>=3.81-blue.svg)](https://gnu.org)
  [![Python](https://shields.io>=3.10-blue.svg)](https://python.org)
  [![Zig](https://shields.io>=0.11.0-orange.svg)](https://ziglang.org)

> https://llms.txt
> 
An ultra-lightweight, polyglot automation matrix and decentralized module orchestrator designed for **Web4 ecosystems**.

---

## 🛠️ Prerequisites
* **GNU Make** (`>=3.81`)
* **Python** (`>=3.10`)
* **Zig Compiler** (`>=0.11.0`, optional)

---

## 🚀 Quick Start
```bash
git clone https://github.com
cd web4.mk
make -f web4.mk init
make -f web4.mk build
make -f web4.mk up
```

---

## ⚙️ Core Commands

| Command | Action |
| :--- | :--- |
| `make -f web4.mk init` | Initializes directories (`/cli`, `/modules`) |
| `make -f web4.mk build` | Compiles native targets via Zig |
| `make -f web4.mk up` | Starts local Web4 sandbox |

---

## 🪟 Windows Setup Note (WSL)
1. Run `wsl --install` in PowerShell.
2. Inside WSL, install tools: `sudo apt install build-essential python3 -y`.
3. Run commands within WSL.

---

## 📄 License
MIT License.
