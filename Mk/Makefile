include docker.mk
include python.mk
include ci.mk
include mk/docker.mk
include mk/python.mk
include mk/node.mk
include mk/test.mk
include mk/release.mk
  bootstrap:
	bash scripts/bootstrap.sh

clean:
	rm -rf node_modules

lint:
	echo "Linting..."

test:
	echo "Running tests..."

dev:
	echo "Starting development..."
  
  docker.mk

  backend.mk

    frontend.mk

    database.mk

    ai.mk

    kubernetes.mk

    docs.mk

    release.mk

    security.mk

    test.mk
