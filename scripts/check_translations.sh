#!/bin/bash
ALL_MD=$(./scripts/list_md_files.sh)
TOTAL=0
DONE=0

echo "Translation Status:"
echo "-------------------"

for file in $ALL_MD; do
  TOTAL=$((TOTAL + 1))
  ZH_FILE="${file%.md}_zh_TW.md"
  if [ -f "$ZH_FILE" ]; then
    echo "[✓] $file -> $ZH_FILE"
    DONE=$((DONE + 1))
  else
    echo "[ ] $file"
  fi
done

echo "-------------------"
echo "Progress: $DONE / $TOTAL completed."
