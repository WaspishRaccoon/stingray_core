FROM ros:humble-ros-base

LABEL org.opencontainers.image.title="Stingray Core"
LABEL org.opencontainers.image.description="Development environment for Stingray Core"
LABEL org.opencontainers.image.vendor="Hydronautics"

ENV DEBIAN_FRONTEND=noninteractive
ENV TERM=xterm-256color
ENV PYTHONUNBUFFERED=1
ENV FORCE_COLOR=1

# -----------------------------------------------------------------------------
# System packages
# -----------------------------------------------------------------------------

RUN apt-get update && apt-get install -y \
    bash \
    bash-completion \
    less \
    command-not-found \
    git \
    curl \
    wget \
    vim \
    nano \
    tree \
    python3-pip \
    python3-colorama \
    python3-rosdep \
    python3-vcstool \
    python3-colcon-common-extensions \
    python3-smbus \
    python3-smbus2 \
    libi2c-dev \
    i2c-tools \
    libasio-dev \
    netcat \
    socat \
    && rm -rf /var/lib/apt/lists/*

# -----------------------------------------------------------------------------
# ROS packages
# -----------------------------------------------------------------------------

RUN apt-get update && apt-get install -y \
    ros-humble-rclcpp \
    ros-humble-std-msgs \
    ros-humble-sensor-msgs \
    ros-humble-udp-msgs \
    ros-humble-rqt \
    ros-humble-rqt-common-plugins \
    ros-humble-rqt-gui-py \
    && rm -rf /var/lib/apt/lists/*

# -----------------------------------------------------------------------------
# rosdep
# -----------------------------------------------------------------------------

RUN rosdep init || true

# -----------------------------------------------------------------------------
# Colcon defaults
# -----------------------------------------------------------------------------

COPY docker/dev/colcon.defaults.yaml /etc/colcon.defaults.yaml

ENV COLCON_DEFAULTS_FILE=/etc/colcon.defaults.yaml

# -----------------------------------------------------------------------------
# Workspace
# -----------------------------------------------------------------------------

WORKDIR /stingray_core

RUN groupadd -f i2c && usermod -aG i2c root

COPY docker/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["bash"]
