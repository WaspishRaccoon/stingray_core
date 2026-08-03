#!/usr/bin/env bash

set -euo pipefail

readonly PROJECT_NAME="stingray_core"

readonly ROS_DISTRO="humble"
readonly ROS_DOMAIN_ID="${ROS_DOMAIN_ID:-1}"

readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly REPOSITORY_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

readonly HOST_WORKSPACE="${REPOSITORY_ROOT}"
readonly CONTAINER_WORKSPACE="/workspace"

readonly IMAGE_NAME="${PROJECT_NAME}"
readonly CONTAINER_NAME="${PROJECT_NAME}"

########################################
# Logging
########################################

log_info() {
    echo -e "\033[1;34m[INFO]\033[0m $*"
}

log_warn() {
    echo -e "\033[1;33m[WARN]\033[0m $*"
}

log_error() {
    echo -e "\033[1;31m[ERROR]\033[0m $*"
}
