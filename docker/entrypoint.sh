#!/usr/bin/env bash

set -euo pipefail

source /opt/ros/humble/setup.bash

if [[ -f /stingray_core/install/setup.bash ]]; then
    source /stingray_core/install/setup.bash
fi

exec "$@"
