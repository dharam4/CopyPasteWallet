#!/bin/bash

set -euo pipefail

SCRIPT_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"${SCRIPT_DIRECTORY}/format.sh" --lint
"${SCRIPT_DIRECTORY}/lint.sh"
