Build modules (.mk)

* python.mk
* node.mk
* go.mk
* rust.mk
* java.mk
* cpp.mk
* c.mk
* docker.mk
* kubernetes.mk
* terraform.mk
* github.mk
* gitlab.mk
* docs.mk
* lint.mk
* test.mk
* release.mk
* security.mk
* deploy.mk
* clean.mk
* web4.mk

Python Mako templates

* script.py.mako
* main.py.mako
* cli.py.mako
* fastapi.py.mako
* flask.py.mako
* django.py.mako
* worker.py.mako
* async.py.mako
* config.py.mako
* settings.py.mako
* tests.py.mako

Configuration templates

* Dockerfile.mako
* docker-compose.yml.mako
* pyproject.toml.mako
* requirements.txt.mako
* package.json.mako
* Cargo.toml.mako
* go.mod.mako
* build.gradle.kts.mako
* pom.xml.mako
* CMakeLists.txt.mako
* Makefile.mako

CI/CD templates

* .github/workflows/ci.yml.mako
* .github/workflows/release.yml.mako
* .gitlab-ci.yml.mako
* azure-pipelines.yml.mako
* Jenkinsfile.mako

Documentation templates

* README.md.mako
* CONTRIBUTING.md.mako
* CODE_OF_CONDUCT.md.mako
* SECURITY.md.mako
* CHANGELOG.md.mako
* LICENSE.mako

Infrastructure templates

* nginx.conf.mako
* postgresql.conf.mako
* redis.conf.mako
* kubernetes-deployment.yaml.mako
* service.yaml.mako
* ingress.yaml.mako
* terraform.tf.mako

# generate the tooling around them:

* A mk CLI to scaffold projects.
* A template registry.
* A template validator.
* A module installer.
* A GitHub Action to test every .mk module.
* Documentation with examples for every template.
