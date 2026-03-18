# MOLISENS/MOSEP Development Environment (ADE)

Main entry point for the MOLISENS/MOSEP software stack. Uses [ADE](https://ade-cli.readthedocs.io/en/latest/) (Agile Development Environment) to manage Docker-based ROS 2 development containers across multiple platforms (x86_64, aarch64, macOS ARM64).

## Prerequisites

Install Docker:

```bash
sudo apt install docker.io
sudo groupadd docker
sudo usermod -aG docker ${USER}
```

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

Enter the ADE container (downloads the Docker image on first run):

```bash
molisens_ade_enter
```

Stop the container (run outside ADE):

```bash
molisens_ade_stop
```

### Available Commands

| Command               | Description                                |
| --------------------- | ------------------------------------------ |
| `molisens_ade_enter`  | Enter the ADE container (starts if needed) |
| `molisens_ade_start`  | Start and enter the container              |
| `molisens_ade_stop`   | Stop the container                         |
| `molisens_ade_update` | Start with Docker image update             |

## Structure

```
ade/
├── install_ade.sh          # Installation script
├── extensions.sh           # Shell env setup and ADE aliases
├── ade+x86_64              # ADE binary (x86_64)
├── ade+aarch64             # ADE binary (ARM64)
├── .aderc_x86_64           # ADE container config (x86_64)
├── .aderc_aarch64          # ADE container config (ARM64, with device mounts)
├── .aderc_arm64            # ADE container config (macOS)
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
    ├── build_ade.sh
    ├── x86_64/                                Dockerfiles for x86_64
    ├── aarch64/                               Dockerfiles for ARM64
    └── Ouster_ROS1/                           ROS 1↔2 bridge for Ouster
```

## Notes on macOS

1. Install ADE for macOS first: https://ade-cli.readthedocs.io/en/latest/install.html
2. Follow the standard installation steps above
3. Run `molisens_ade_enter`
4. Follow the instructions in `MOLISENS/molisens_ws/src/drivers/smartmicro_ros2_radars/Readme.md` under the ARMv8 Support section
5. Run `molisens_make` inside the ADE container
