#!/usr/bin/env bash
# Schnellvorschau für die Autorenansicht der Sedrila-Inhalte
#
# 1. Baut die Seite (Stage „draft“) unter ./propra-inf/out
# 2. Startet einen lokalen HTTP-Server
# 3. Öffnet automatisch den Browser auf http://localhost:8000

set -euo pipefail

# Verzeichnis dieser Datei = Projektwurzel
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "$SCRIPT_DIR/propra-inf"

echo "[1/3] Baue Inhalte mit sedrila …"
sedrila author --config sedrila.yaml --include_stage draft out

echo "[2/3] Starte HTTP-Server …"
cd out
python3 -m http.server 8000 &
SERVER_PID=$!

# Warten, bis der Server lauscht (kleine Pause reicht meist)
sleep 1

URL="http://localhost:8000"
echo "[3/3] Öffne Browser auf $URL …"
# Versuche in WSL/Unix/Windows-Umgebungen einen Browser zu öffnen
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