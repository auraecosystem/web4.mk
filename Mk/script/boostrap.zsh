#!/usr/bin/env bash

set -e

echo "🚀 Bootstrapping Web4 Marketplace..."

mkdir -p apps/web
mkdir -p apps/admin
mkdir -p apps/mobile
mkdir -p apps/docs

mkdir -p services/auth
mkdir -p services/domains
mkdir -p services/ai
mkdir -p services/payments
mkdir -p services/search
mkdir -p services/notifications
mkdir -p services/analytics

mkdir -p packages

mkdir -p infrastructure/docker
mkdir -p infrastructure/kubernetes
mkdir -p infrastructure/nginx

mkdir -p scripts

touch README.md
touch LICENSE
touch docker-compose.yml
touch .env.example
touch .gitignore
touch .editorconfig

echo "✅ Project scaffold created."
