#!/usr/bin/env zsh

set -e
cd "$(dirname "$0")"

pnpm exec cap sync
pnpm exec cap open ios
