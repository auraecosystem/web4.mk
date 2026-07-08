name := hello
.PHONY: run

run:
	@printf "Running module: %s\n" "$(name)"
	@python3 main.py
  main.py

  # replace existing help target with:
.PHONY: help
help: ## Show this list of available commands
	@echo "Available targets:"
	@grep -E '^[a-zA-Z0-9._-]+:.*?## ' web4.mk | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-20s %s\n", $$1, $$2}'
