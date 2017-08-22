#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

hash jazzy 2>/dev/null || { echo >&2 "jazzy is required to generate documentation but it's not installed"; exit 1; }

jazzy \
  --author 'Mark Scott' \
  --clean \
  --documentation 'Guides/*.md' \
  --github_url 'https://github.com/codebrewer/HillListsBackupLibrary' \
  --module 'HillListsBackupLibrary' \
  --module-version 1.1.0 \
  --output docs/ \
  --readme 'README.md' \
  --source-directory . \
  --swift-version 3.1
