#!/bin/bash
set -euo pipefail

# Only run in remote Claude Code environments
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

# Async with a long timeout — GHCup + GHC 9.12 + dhall deps can take 30-60 min on
# a cold container, but the result is cached so subsequent sessions start instantly.
echo '{"async": true, "asyncTimeout": 3600000}'

GHCUP_BIN="$HOME/.ghcup/bin/ghcup"
CABAL_BIN="$HOME/.cabal/bin/cabal"
GHC_VERSION="9.12.2"

# ── Pre-flight: verify downloads.haskell.org is reachable ────────────────────
if ! curl -sI --max-time 10 -o /dev/null "https://downloads.haskell.org/" 2>/dev/null; then
  echo "[session-start] ERROR: downloads.haskell.org is not reachable."
  echo "[session-start] This environment's network policy blocks the Haskell download CDN."
  echo "[session-start] To fix: allowlist downloads.haskell.org and hackage.haskell.org"
  echo "[session-start]         in your Claude Code environment's network policy settings."
  echo "[session-start] See: https://code.claude.com/docs/en/claude-code-on-the-web"
  echo "[session-start] Falling back: the GitHub Actions CI workflow handles make build on push."
  exit 0
fi

# ── 1. Bootstrap GHCup if missing ────────────────────────────────────────────
if [ ! -x "$GHCUP_BIN" ]; then
  echo "[session-start] Installing GHCup..."
  # Download the GHCup binary directly from GitHub releases (avoids the bootstrap
  # script which also hits downloads.haskell.org for metadata)
  mkdir -p "$HOME/.ghcup/bin"
  curl -fsSL -o "$GHCUP_BIN" \
    "https://github.com/haskell/ghcup-hs/releases/download/v0.1.50.0/x86_64-linux-ghcup-0.1.50.0"
  chmod +x "$GHCUP_BIN"
fi

export PATH="$HOME/.ghcup/bin:$HOME/.cabal/bin:$PATH"

# ── 2. Install GHC 9.12.2 if missing ─────────────────────────────────────────
if ! ghcup list -t ghc -c installed | grep -q "$GHC_VERSION"; then
  echo "[session-start] Installing GHC $GHC_VERSION..."
  ghcup install ghc "$GHC_VERSION" --set
else
  ghcup set ghc "$GHC_VERSION"
fi

# ── 3. Install cabal-install if missing ───────────────────────────────────────
if [ ! -x "$CABAL_BIN" ]; then
  echo "[session-start] Installing cabal-install..."
  ghcup install cabal --set
fi

# ── 4. Update package index and pre-build all dependencies ───────────────────
echo "[session-start] Updating cabal package index..."
cabal update

echo "[session-start] Pre-building project dependencies (slow on first run, cached after)..."
cd "$CLAUDE_PROJECT_DIR"
cabal build all 2>&1

# ── 5. Persist PATH for the session ──────────────────────────────────────────
echo "export PATH=\"$HOME/.ghcup/bin:$HOME/.cabal/bin:\$PATH\"" >> "$CLAUDE_ENV_FILE"

echo "[session-start] Haskell environment ready. $(ghc --version), $(cabal --version | head -1)."
