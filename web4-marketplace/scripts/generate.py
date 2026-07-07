#!/usr/bin/env python3
"""
generate.py

Generate directory and endpoint wordlists from templates.

Usage:
    python generate.py \
        --templates templates/ \
        --output generated/raft-large-directories.txt
"""

from pathlib import Path
import argparse
import itertools

# --------------------------------------------------------------------
# Default values
# --------------------------------------------------------------------

PREFIXES = [
    "",
    "api",
    "admin",
    "dashboard",
    "user",
    "users",
    "auth",
    "wallet",
    "marketplace",
    "sdk",
    "cloud",
    "ai",
    "blockchain",
    "docs",
]

VERSIONS = [
    "",
    "v1",
    "v2",
    "v3",
    "beta",
]

RESOURCES = [
    "login",
    "logout",
    "register",
    "products",
    "orders",
    "payments",
    "checkout",
    "profile",
    "settings",
    "analytics",
    "metrics",
    "health",
    "status",
]

SUFFIXES = [
    "",
    ".json",
    ".yaml",
    ".xml",
]

# --------------------------------------------------------------------
# Load template files
# --------------------------------------------------------------------

def load_templates(folder: Path):
    templates = []

    if not folder.exists():
        return templates

    for file in folder.glob("*.txt"):
        for line in file.read_text().splitlines():
            line = line.strip()

            if not line:
                continue

            if line.startswith("#"):
                continue

            templates.append(line)

    return templates


# --------------------------------------------------------------------
# Generate combinations
# --------------------------------------------------------------------

def generate():
    generated = set()

    for prefix, version, resource, suffix in itertools.product(
            PREFIXES,
            VERSIONS,
            RESOURCES,
            SUFFIXES):

        path = "/".join(
            p for p in [prefix, version, resource] if p
        )

        generated.add(path + suffix)

    return generated


# --------------------------------------------------------------------
# Main
# --------------------------------------------------------------------

def main():

    parser = argparse.ArgumentParser()

    parser.add_argument(
        "--templates",
        default="templates",
        help="Template directory")

    parser.add_argument(
        "--output",
        default="generated/raft-large-directories.txt")

    args = parser.parse_args()

    output = Path(args.output)
    output.parent.mkdir(parents=True, exist_ok=True)

    words = set(generate())

    words.update(load_templates(Path(args.templates)))

    words = sorted(words)

    output.write_text(
        "\n".join(words),
        encoding="utf-8"
    )

    print(f"Generated {len(words):,} entries")
    print(f"Saved to {output}")


if __name__ == "__main__":
    main()
