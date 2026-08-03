#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/common.sh"

source "/opt/ros/${ROS_DISTRO}/setup.bash"

cd "${CONTAINER_WORKSPACE}"

log_info "Installing dependencies..."

rosdep install \
    --from-paths src \
    --ignore-src \
    --recursive \
    -y

log_info "Building workspace..."

colcon build \
    --event-handlers console_direct+

log_info "Build completed successfully."
