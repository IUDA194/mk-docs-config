#!/bin/sh
set -eu

: "${GIT_TOKEN:?GIT_TOKEN is required}"
: "${REPO_CONFIG:?REPO_CONFIG is required}"   # e.g. IUDA194/mk-docs-config
: "${REPO_DOCS:?REPO_DOCS is required}"       # e.g. TrafficGramm/account_processor

BRANCH_CONFIG="${BRANCH_CONFIG:-main}"
BRANCH_DOCS="${BRANCH_DOCS:-main}"

rm -rf /tmp/config /tmp/docs /site
mkdir -p /site

git clone --depth=1 --branch "$BRANCH_CONFIG" "https://${GIT_TOKEN}@github.com/${REPO_CONFIG}.git" /tmp/config
git clone --depth=1 --branch "$BRANCH_DOCS"   "https://${GIT_TOKEN}@github.com/${REPO_DOCS}.git"   /tmp/docs

# Собираем "проект" mkdocs в /site
cp /tmp/config/mkdocs.yml /site/mkdocs.yml
cp -r /tmp/docs/docs /site/docs

cd /site
mkdocs serve -a 0.0.0.0:8000
