#!/usr/bin/env bash
# seo-tokens.sh — replace Search Console, Bing, and Google Analytics placeholders
# across every HTML page in BushmanQC/ in one pass.
#
# Usage:
#   scripts/seo-tokens.sh --gsc <google-token> --bing <bing-token> --ga4 <G-XXXXXXXXXX>
#
# All three flags are optional; only the values you supply are applied. Re-run
# safely: the script only matches the original placeholder strings.
#
# Examples:
#   scripts/seo-tokens.sh --gsc abc123XYZ
#   scripts/seo-tokens.sh --gsc abc123 --bing 9F8E7D --ga4 G-AB12CD34EF
#
# After running, commit and deploy. See README-SEO.md for the verification steps.

set -euo pipefail

GSC=""
BING=""
GA4=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --gsc)  GSC="$2";  shift 2 ;;
    --bing) BING="$2"; shift 2 ;;
    --ga4)  GA4="$2";  shift 2 ;;
    -h|--help)
      sed -n '2,16p' "$0"
      exit 0
      ;;
    *)
      echo "Unknown flag: $1" >&2
      exit 1
      ;;
  esac
done

if [[ -z "$GSC" && -z "$BING" && -z "$GA4" ]]; then
  echo "Nothing to do. Supply at least one of --gsc, --bing, --ga4." >&2
  exit 1
fi

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SITE="$ROOT/BushmanQC"

# Find all HTML files in BushmanQC/ and BushmanQC/insights/
mapfile -t FILES < <(find "$SITE" -maxdepth 2 -name '*.html')

if [[ ${#FILES[@]} -eq 0 ]]; then
  echo "No HTML files found under $SITE" >&2
  exit 1
fi

echo "Updating ${#FILES[@]} HTML files in $SITE"

for f in "${FILES[@]}"; do
  if [[ -n "$GSC" ]]; then
    sed -i.bak "s|REPLACE_WITH_GSC_TOKEN|$GSC|g" "$f"
  fi
  if [[ -n "$BING" ]]; then
    sed -i.bak "s|REPLACE_WITH_BING_TOKEN|$BING|g" "$f"
  fi
  if [[ -n "$GA4" ]]; then
    # Replace both occurrences of G-XXXXXXXXXX inside the GA4 block.
    sed -i.bak "s|G-XXXXXXXXXX|$GA4|g" "$f"
    # Uncomment the GA4 script block (it's wrapped in <!-- ... -->).
    # The block opens with "<!-- <script async src=..."googletagmanager.com..."
    # and closes with "</script> -->".
    python3 - "$f" <<'PY'
import re, sys
path = sys.argv[1]
with open(path, 'r') as fp:
    html = fp.read()

# Match the commented GA4 block and strip the outer comment markers.
pattern = re.compile(
    r'<!--\s*(<script async src="https://www\.googletagmanager\.com/gtag/js\?id=G-[^"]+"></script>\s*<script>.*?</script>)\s*-->',
    re.DOTALL,
)
new = pattern.sub(r'\1', html, count=1)
if new != html:
    with open(path, 'w') as fp:
        fp.write(new)
PY
  fi
  rm -f "${f}.bak"
done

echo "Done. Verify with: grep -r 'REPLACE_WITH\\|G-XXXXXXXXXX' $SITE"
echo "If clean, commit and deploy (\`wrangler deploy\` or merge the PR)."
