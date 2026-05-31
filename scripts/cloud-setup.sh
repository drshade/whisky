#!/bin/bash
# Haskell toolchain for the Claude Code web sandbox.
# Setup (network allowlist + how to wire this up) is documented in AGENTS.md.
set -euo pipefail

export LC_ALL=C.utf8

# libgmp is needed by GHC; install it before the toolchain.
apt-get update && apt-get install -y libgmp-dev

export BOOTSTRAP_HASKELL_NONINTERACTIVE=1
export BOOTSTRAP_HASKELL_GHC_VERSION=9.12.2
export BOOTSTRAP_HASKELL_CABAL_VERSION=3.14.2.0
export BOOTSTRAP_HASKELL_INSTALL_NO_STACK=1
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

# Expose ghc and cabal on PATH for non-login shells.
ln -sf /root/.ghcup/bin/* /usr/local/bin/

cabal update || true
