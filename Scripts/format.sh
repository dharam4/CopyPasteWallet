#!/bin/bash

set -euo pipefail

if [[ "${CI:-}" == "true" || "${GITHUB_ACTIONS:-}" == "true" ]]; then
    echo "SwiftFormat is disabled in CI."
    exit 0
fi

REPOSITORY_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

swift run \
    --package-path "${REPOSITORY_ROOT}/BuildTools" \
    -c release \
    swiftformat \
    "${REPOSITORY_ROOT}/App" \
    "${REPOSITORY_ROOT}/Packages" \
    --config "${REPOSITORY_ROOT}/.swiftformat" \
    "$@"
