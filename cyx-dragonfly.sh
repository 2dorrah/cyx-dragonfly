#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
PYTHON_MINER="$SCRIPT_DIR/cythanx_dragonfly_native_miner.py"

if [[ ! -f "$PYTHON_MINER" ]]; then
    echo "[ERROR] Python miner not found:"
    echo "        $PYTHON_MINER"
    exit 1
fi

PYTHON_BIN="${PYTHON_BIN:-python3}"

if ! command -v "$PYTHON_BIN" >/dev/null 2>&1; then
    echo "[ERROR] Python executable not found: $PYTHON_BIN"
    echo "[INFO] Set PYTHON_BIN to a valid Python 3 executable."
    exit 1
fi

echo "============================================================"
echo " CYTHANX DRAGONFLY NATIVE MINER"
echo "============================================================"
echo " Miner : $PYTHON_MINER"
echo " Python: $PYTHON_BIN"
echo " Args  : $*"
echo "============================================================"

exec "$PYTHON_BIN" "$PYTHON_MINER" "$@"
