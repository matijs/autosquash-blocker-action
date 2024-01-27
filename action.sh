#!/usr/bin/env bash
set -euxo pipefail

git log --pretty=%s --walk-reflogs | grep --quiet -E '^(amend|fixup|squash)!' && exit 1 || exit 0
