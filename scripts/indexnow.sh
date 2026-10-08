#!/usr/bin/env bash
# Ping IndexNow (Bing, Copilot, Yandex, Seznam, Naver...) with changed URLs so
# new or edited pages are recrawled in minutes instead of days. Bing's index
# also feeds Copilot answers and ChatGPT search.
#
# Usage: scripts/indexnow.sh <url> [<url> ...]
#        scripts/indexnow.sh --all          # every URL in BushmanQC/sitemap.xml
set -euo pipefail

HOST="bushmanqc.com"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
# The key is the name of the 32-hex-char .txt file at the site root.
KEY_FILE="$(find "$ROOT/BushmanQC" -maxdepth 1 -regextype posix-extended -regex '.*/[0-9a-f]{32}\.txt' | head -1)"
[[ -n "$KEY_FILE" ]] || { echo "IndexNow key file not found in BushmanQC/"; exit 1; }
KEY="$(basename "$KEY_FILE" .txt)"

if [[ "${1:-}" == "--all" ]]; then
  mapfile -t URLS < <(grep -o '<loc>[^<]*</loc>' "$ROOT/BushmanQC/sitemap.xml" | sed -E 's#</?loc>##g')
else
  URLS=("$@")
fi
[[ ${#URLS[@]} -gt 0 ]] || { echo "No URLs to submit."; exit 0; }

JSON_URLS=$(printf '"%s",' "${URLS[@]}")
BODY="{\"host\":\"$HOST\",\"key\":\"$KEY\",\"keyLocation\":\"https://$HOST/$KEY.txt\",\"urlList\":[${JSON_URLS%,}]}"

printf 'Submitting %d URL(s) to IndexNow:\n' "${#URLS[@]}"
printf '  %s\n' "${URLS[@]}"
STATUS=$(curl -sS -o /dev/null -w '%{http_code}' -X POST https://api.indexnow.org/indexnow \
  -H 'Content-Type: application/json; charset=utf-8' --data "$BODY")
echo "IndexNow responded HTTP $STATUS"
# 200 = accepted; 202 = accepted, key validation pending
[[ "$STATUS" == "200" || "$STATUS" == "202" ]]
