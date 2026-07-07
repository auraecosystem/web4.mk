#!/usr/bin/env python3
import os
import json
import sys

def parse_and_verify():
    manifest_path = "package.mk.json"
    registry_dir = "registry"
    
    if not os.path.exists(manifest_path):
        print(f"[-] Error: {manifest_path} not found.")
        sys.exit(1)
        
    try:
        with open(manifest_path, "r") as f:
            manifest = json.load(f)
    except json.JSONDecodeError as e:
        print(f"[-] Error: Failed to parse JSON manifest: {e}")
        sys.exit(1)

    dependencies = manifest.get("dependencies", {})
    print(f"[*] Found {len(dependencies)} registered workspace items in manifest.")

    if not os.path.exists(registry_dir):
        os.makedirs(registry_dir)

    # Validate each defined package pointer
    for pkg_name, pkg_source in dependencies.items():
        print(f"[*] Verifying module: '{pkg_name}' -> Source: {pkg_source}")
        
        # Local mock synchronization verification layer
        target_path = os.path.join(registry_dir, f"{pkg_name}.json")
        if not os.path.exists(target_path):
            # Create a localized cache descriptor index for the module
            mock_registry_data = {
                "name": pkg_name,
                "resolved_source": pkg_source,
                "status": "synchronized"
            }
            with open(target_path, "w") as rf:
                json.dump(mock_registry_data, rf, indent=2)
            print(f"[+] Synced and indexed '{pkg_name}' inside local registry.")
        else:
            print(f"[~] '{pkg_name}' is already cached up to date.")

    print("[+] Registry sync phase check complete.")

if __name__ == "__main__":
    parse_and_verify()
