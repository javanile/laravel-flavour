#!/usr/bin/env bash

source .env

git add .
git commit -m "Update to Laravel ${LARAVEL_VERSION}" || echo "No changes to commit"
git tag -fa "v${LARAVEL_VERSION}" -m "${LARAVEL_VERSION}"
git push origin --tags -f
