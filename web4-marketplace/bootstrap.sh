#!/usr/bin/env bash

set -e

PROJECT="web4-marketplace"

echo "🚀 Creating $PROJECT..."

mkdir -p $PROJECT

cd $PROJECT

mkdir -p \
apps/web \
apps/admin \
apps/mobile \
apps/docs \
apps/api-portal \
services/auth \
services/users \
services/domains \
services/marketplace \
services/auctions \
services/payments \
services/billing \
services/escrow \
services/search \
services/ai \
services/analytics \
services/notifications \
services/logging \
services/gateway \
packages/ui \
packages/sdk \
packages/database \
packages/config \
packages/types \
infrastructure/docker \
infrastructure/kubernetes \
infrastructure/nginx \
scripts \
tests \
docs \
.github/workflows

touch \
README.md \
LICENSE \
CHANGELOG.md \
CODE_OF_CONDUCT.md \
CONTRIBUTING.md \
SECURITY.md \
docker-compose.yml \
.env.example \
.gitignore \
.editorconfig \
Makefile \
package.json

echo "# Web4 Marketplace" > README.md

cat > .gitignore << 'EOF'
node_modules/
dist/
build/
coverage/

.venv/
venv/
__pycache__/
*.pyc

.env
.env.*

.idea/
.vscode/

*.log
.DS_Store
EOF

cat > .editorconfig << 'EOF'
root = true

[*]
charset = utf-8
end_of_line = lf
indent_style = space
indent_size = 2
insert_final_newline = true
trim_trailing_whitespace = true
EOF

cat > package.json << 'EOF'
{
  "name": "web4-marketplace",
  "private": true,
  "version": "0.1.0",
  "workspaces": [
    "apps/*",
    "services/*",
    "packages/*"
  ],
  "scripts": {
    "dev": "echo Starting development...",
    "build": "echo Building...",
    "test": "echo Testing...",
    "lint": "echo Linting..."
  }
}
EOF

cat > docker-compose.yml << 'EOF'
version: "3.9"

services:

  postgres:
    image: postgres:16
    restart: always
    environment:
      POSTGRES_DB: web4
      POSTGRES_USER: web4
      POSTGRES_PASSWORD: web4
    ports:
      - "5432:5432"

  redis:
    image: redis:7
    restart: always
    ports:
      - "6379:6379"

EOF

cat > Makefile << 'EOF'
bootstrap:
	bash bootstrap.sh

dev:
	docker compose up

stop:
	docker compose down

logs:
	docker compose logs -f
EOF

cat > .github/workflows/ci.yml << 'EOF'
name: CI

on:
  push:
    branches: [main]
  pull_request:

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v4

      - name: Build
        run: echo "CI Ready"
EOF

echo "✅ Repository scaffold completed."

echo ""
echo "Next steps:"
echo "1. git init"
echo "2. git add ."
echo "3. git commit -m 'Initial scaffold'"
echo "4. git branch -M main"
echo "5. git remote add origin <repository-url>"
echo "6. git push -u origin main"
