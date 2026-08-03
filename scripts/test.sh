#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/common.sh"

cd "${CONTAINER_WORKSPACE}"

source install/setup.bash

log_info "Running tests..."

colcon test \
    --event-handlers console_direct+

log_info "Collecting test results..."

colcon test-result --verbose

log_info "All tests passed."
