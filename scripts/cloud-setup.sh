#!/bin/bash
# Toolchain install for Claude Code on the web (cloud sandbox).
#
# This is the canonical copy. Paste it into the environment's **Setup script**
# field in the claude.ai/code UI, OR set the field to a one-liner that fetches
# this file (the repo is public, raw.githubusercontent.com is allowlisted):
#
#   #!/bin/bash
#   curl -fsSL https://raw.githubusercontent.com/drshade/whisky/main/scripts/cloud-setup.sh | bash
#
# Requires Network access = Custom with `*.haskell.org` allowed (ghcup pulls from
# get-ghcup.haskell.org + downloads.haskell.org, which are NOT in the Trusted
# defaults). hackage.haskell.org IS in the defaults, so `cabal` itself is fine.
#
# Runs as root on Ubuntu 24.04, before Claude launches; the result is cached, so
# the slow GHC install only happens on the first session in the environment.
set -euo pipefail

export LC_ALL=C.utf8

# libgmp is needed by GHC — install it before the toolchain (base image usually
# has libgmp10, but install the dev headers up front to be safe).
apt-get update && apt-get install -y libgmp-dev

export BOOTSTRAP_HASKELL_NONINTERACTIVE=1
export BOOTSTRAP_HASKELL_GHC_VERSION=9.12.2
export BOOTSTRAP_HASKELL_CABAL_VERSION=3.14.2.0
export BOOTSTRAP_HASKELL_INSTALL_NO_STACK=1
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

# Put ghc/cabal on PATH for the (non-login) shells Claude uses.
ln -sf /root/.ghcup/bin/* /usr/local/bin/

# Warm the Hackage index so the first `cabal build` is quicker.
cabal update || true
