#!/bin/bash
find . -type f -name "*.md" ! -name "*_zh_TW.md" ! -path "*/node_modules/*" ! -path "*/.git/*"
