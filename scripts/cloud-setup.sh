#!/bin/bash
# Haskell toolchain for the Claude Code web sandbox. See AGENTS.md.
# Deliberately pipe-free and short-lined: the web setup-script field mangles
# long lines and "|", so no `curl | sh` and no `||` here.
set -eu

export LC_ALL=C.utf8

apt-get update
apt-get install -y libgmp-dev

export BOOTSTRAP_HASKELL_NONINTERACTIVE=1
export BOOTSTRAP_HASKELL_GHC_VERSION=9.12.2
export BOOTSTRAP_HASKELL_CABAL_VERSION=3.14.2.0
export BOOTSTRAP_HASKELL_INSTALL_NO_STACK=1

curl -sSf -o /tmp/ghcup.sh https://get-ghcup.haskell.org
sh /tmp/ghcup.sh

ln -sf /root/.ghcup/bin/* /usr/local/bin/

if ! cabal update; then echo "cabal update failed (non-fatal)"; fi
