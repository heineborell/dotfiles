#!/bin/bash
tmpdir=$(mktemp -d)
cat > "$tmpdir/email.eml"

ripmime -i "$tmpdir/email.eml" -d "$tmpdir"

# Find first text/html file (usually named something like 0001.html)
htmlfile=$(find "$tmpdir" -type f -name "*.html" | head -n1)

if [[ -f "$htmlfile" ]]; then
  pandoc -f html -t plain "$htmlfile"
fi

rm -rf "$tmpdir"
