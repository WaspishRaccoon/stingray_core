#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

log_info() {
    echo -e "\033[1;34m[INFO]\033[0m $*"
}

log_info "Starting CI pipeline..."

"${SCRIPT_DIR}/build.sh"
"${SCRIPT_DIR}/test.sh"

log_info "CI finished successfully."
