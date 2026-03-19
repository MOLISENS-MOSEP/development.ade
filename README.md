# MOLISENS/MOSEP Development Environment

Main entry point for the MOLISENS/MOSEP software stack. Uses Docker Compose and [just](https://github.com/casey/just) to manage Docker-based ROS 2 development containers across multiple platforms (x86_64, aarch64, macOS ARM64).

## Prerequisites

**Docker:**

```bash
sudo apt install docker.io
sudo groupadd docker
sudo usermod -aG docker ${USER}
```

**just** (command runner):

Can be instlled via Python:
```bash
uv tool install rust-just
# or
pipx install rust-just
```

or check the [install guide](https://github.com/casey/just/blob/master/README.md#installation).

## Installation

1. Set the installation directory (add to your `.bashrc` or `.zshrc`):

```bash
export MOLISENS_DIR="<WHEREVER_YOU_WANT>/MOLISENS"
```
For example `export MOLISENS_DIR="/home/$USER/projects/MOLISENS"`

2. Clone and run the install script:

```bash
mkdir -p $MOLISENS_DIR
git clone https://github.com/MOLISENS-MOSEP/development.ade.git $MOLISENS_DIR/ade
$MOLISENS_DIR/ade/install_ade.sh
```

If you get `permission denied`, run `chmod +x $MOLISENS_DIR/ade/install_ade.sh` first.

3. **Restart your terminal.**

4. Login to the GitHub Container Registry with a [personal access token](https://github.com/settings/tokens):

```bash
export CR_PAT=YOUR_TOKEN
echo $CR_PAT | docker login ghcr.io -u USERNAME --password-stdin
```

## Usage

Enter the development container (downloads the Docker image on first run):

```bash
mosep_enter
```

Stop the container:

```bash
mosep_stop
```

You can also use `just` directly from the `ade/` directory:

```bash
cd $MOLISENS_DIR/ade
just enter
just stop
just update
```

### Available Commands

| Alias          | just recipe   | Description                            |
| -------------- | ------------- | -------------------------------------- |
| `mosep_enter`  | `just enter`  | Enter the container (starts if needed) |
| `mosep_stop`   | `just stop`   | Stop the container                     |
| `mosep_update` | `just update` | Pull latest image and restart          |
| —              | `just logs`   | Show container logs                    |
| —              | `just status` | Show container status                  |

## Structure

```
ade/
├── install_ade.sh          # Installation script
├── extensions.sh           # Shell env setup and aliases
├── compose.yaml            # Docker Compose base config (x86_64)
├── compose.aarch64.yaml    # Docker Compose overrides (ARM64 devices)
├── justfile                # Task runner recipes
└── MOLISENS/
    ├── bagfiles/           # Recorded rosbag data
    └── molisens_ws/        # ROS 2 workspace (cloned during install)
```

## Detailed Repository Overview

The MOLISENS/MOSEP project is split across multiple repositories. The `install_ade.sh` script clones `molisens_ws`, which in turn uses `vcs import` to pull all sub-repos into `src/`. Docker images are built separately from `development.docker`.

```
$MOLISENS_DIR/
├── ade/                                    ← development.ade (this repo)
│   ├── install_ade.sh
│   ├── extensions.sh
│   ├── compose.yaml
│   ├── compose.aarch64.yaml
│   ├── justfile
│   └── MOLISENS/
│       ├── bagfiles/                       ← recorded rosbag data
│       └── molisens_ws/                    ← molisens_ws repo
│           ├── config/                        workspace config & aliases
│           ├── repos/
│           │   └── molisens.repos             vcstool manifest
│           └── src/                           cloned via vcs import
│               ├── data/
│               │   ├── mapping_sensor_kit/    ← data.mapping_sensor_kit
│               │   ├── met_sensor_kit/        ← data.met_sensor_kit
│               │   └── convert_lidar_packets/ ← data.convert_lidar_packets
│               ├── drivers/
│               │   ├── lufft_weather_station/ ← drivers.lufft_weather_station
│               │   ├── ouster-ros/            (third-party)
│               │   ├── ublox/                 (third-party)
│               │   ├── xsens_ros_mti_driver/  (third-party)
│               │   └── smartmicro_ros2_radars/(third-party)
│               └── tools/
│                   ├── data_recording/        ← tools.data_recording
│                   ├── met_monitoring/        ← tools.met_monitoring
│                   └── ntrip_client/          (third-party)
└── docker/                                 ← development.docker repo
    ├── build.sh
    ├── x86_64/                                Dockerfiles for x86_64
    ├── aarch64/                               Dockerfiles for ARM64
    └── Ouster_ROS1/                           ROS 1↔2 bridge for Ouster
```

## Notes on macOS

1. Install [Docker Desktop](https://www.docker.com/products/docker-desktop/) and [just](https://github.com/casey/just#installation)
2. Follow the standard installation steps above
3. Run `mosep_enter`
4. Follow the instructions in `MOLISENS/molisens_ws/src/drivers/smartmicro_ros2_radars/Readme.md` under the ARMv8 Support section
5. Run `molisens_make` inside the container
