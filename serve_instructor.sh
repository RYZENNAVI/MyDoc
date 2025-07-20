#!/usr/bin/env bash
# Schnellvorschau für die Instruktor-Ansicht der Sedrila-Inhalte
#
# 1. Baut die Seite (Stage „draft“) unter ./propra-inf/out
# 2. Wechselt in ./propra-inf/out/instructor
# 3. Startet einen lokalen HTTP-Server und öffnet den Browser

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "$SCRIPT_DIR/propra-inf"

echo "[1/3] Baue Inhalte mit sedrila …"
sedrila author --config sedrila.yaml --include_stage draft out

echo "[2/3] Starte HTTP-Server …"
cd out/instructor
python3 -m http.server 8000 &
SERVER_PID=$!

sleep 1

URL="http://localhost:8000"
echo "[3/3] Öffne Browser auf $URL …"
if command -v wslview >/dev/null 2>&1; then
  wslview "$URL" || true
elif command -v powershell.exe >/dev/null 2>&1; then
  powershell.exe -NoProfile -Command "Start-Process '$URL'" || true
elif command -v xdg-open >/dev/null 2>&1; then
  xdg-open "$URL" || true
else
  python3 -m webbrowser -t "$URL" || true
fi

trap 'echo "\nBeende Server …"; kill $SERVER_PID' INT TERM
wait $SERVER_PID 