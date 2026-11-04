#!/usr/bin/env bash
set -euo pipefail

repo_dir="/home/ivaneh/nixos"
flake_ref="$repo_dir#nixos"

cd "$repo_dir"

if ! command -v nix >/dev/null 2>&1; then
  printf 'Error: nix is not installed or is not on PATH.\n' >&2
  exit 1
fi

if ! command -v nixos-rebuild >/dev/null 2>&1; then
  printf 'Error: nixos-rebuild is not installed or is not on PATH.\n' >&2
  exit 1
fi

if ! git diff --quiet -- flake.lock || ! git diff --cached --quiet -- flake.lock; then
  printf 'Error: flake.lock has local changes. Review or commit them before updating inputs.\n' >&2
  exit 1
fi

printf 'Updating flake inputs...\n'
nix flake update

printf '\nChanges to flake.lock:\n'
git --no-pager diff -- flake.lock || true

printf '\nBuilding %s...\n' "$flake_ref"
nixos-rebuild build --show-trace --flake "$flake_ref"

printf '\nBuild succeeded. The current system has not been changed.\n'
read -r -p 'Switch to this configuration now? [y/N] ' answer
case "$answer" in
  y|Y|yes|YES)
    sudo nixos-rebuild switch --show-trace --flake "$flake_ref"
    printf '\nUpgrade activated successfully.\n'
    ;;
  *)
    printf '\nNot switching. Updated flake.lock and the built system are ready for review.\n'
    ;;
esac
