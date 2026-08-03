#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/common.sh"

########################################
# Docker
########################################

docker_build_image() {

    log_info "Building Docker image '${IMAGE_NAME}'..."

    docker build \
        -t "${IMAGE_NAME}" \
        -f "${HOST_WORKSPACE}/docker/Dockerfile" \
        "${HOST_WORKSPACE}"

    log_info "Docker image built."
}

docker_remove_container() {

    if docker ps -a --format '{{.Names}}' | grep -qx "${CONTAINER_NAME}"; then

        log_warn "Removing existing container..."

        docker rm -f "${CONTAINER_NAME}"

    fi
}

docker_run_dev() {

    docker_remove_container

    xhost +local:root >/dev/null 2>&1 || true

    docker run -it --rm \
        --privileged \
        --network host \
        --name "${CONTAINER_NAME}" \
        -v "${HOST_WORKSPACE}:${CONTAINER_WORKSPACE}" \
        -v "${HOST_WORKSPACE}/docker/dev/.bashrc:/root/.bashrc:ro" \
        -v "${HOST_WORKSPACE}/docker/dev/.inputrc:/root/.inputrc:ro" \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -v /dev:/dev \
        -e DISPLAY \
        -e ROS_DOMAIN_ID="${ROS_DOMAIN_ID}" \
        "${IMAGE_NAME}"
}

docker_run_ci() {

    docker run --rm \
        -v "${HOST_WORKSPACE}:${CONTAINER_WORKSPACE}" \
        "${IMAGE_NAME}" \
        ./scripts/ci.sh

}
