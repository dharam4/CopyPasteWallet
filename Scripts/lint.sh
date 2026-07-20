#!/bin/bash

set -euo pipefail

if [[ "${CI:-}" == "true" || "${GITHUB_ACTIONS:-}" == "true" ]]; then
    echo "SwiftLint is disabled in CI."
    exit 0
fi

REPOSITORY_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

swift package resolve --package-path "${REPOSITORY_ROOT}/BuildTools"

SWIFTLINT_EXECUTABLE="${REPOSITORY_ROOT}/BuildTools/.build/artifacts/swiftlint/SwiftLintBinary/SwiftLintBinary.artifactbundle/macos/swiftlint"

if [[ ! -x "${SWIFTLINT_EXECUTABLE}" ]]; then
    echo "SwiftLint binary artifact was not found." >&2
    exit 1
fi

"${SWIFTLINT_EXECUTABLE}" lint \
    --config "${REPOSITORY_ROOT}/.swiftlint.yml" \
    --strict
