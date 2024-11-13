# MOLISENS/MOSEP Software Stack

This repo holds the software stack for the MOLISENS/MOSEP project. It is based on ROS2 and uses the ADE (agile development environment) to manage the docker containers.

## Installation

### Prerequisites

This software stack uses Docker to run all the necessary tools. To install Docker you can use the following commands:
```bash
sudo apt install docker.io
sudo groupadd docker
sudo usermod -aG docker ${USER}
```

### Run the install script

The software stack is built on the basis of ADE (agile development environment), which is a tool to manage docker containers. It will be installed automotically in the following steps.

To use the MOLISENS docker container with ADE you need the following commands to set it up:

Execute and add the following line to your .zprofile or .bashrc
```bash
export MOLISENS_DIR="WHEREVER_YOU_WANT/MOLISENS"
```
WHEREVER_YOU_WANT is the folder where you want to install ade and the MOLISENS repos. For example `export MOLISENS_DIR="/home/$USER/projects/MOLISENS"`.

Now you can execute the following commands to install the MOLISENS ADE:
```bash	
mkdir -p $MOLISENS_DIR
git clone https://github.com/MOLISENS-MOSEP/development.ade.git $MOLISENS_DIR/ade
$MOLISENS_DIR/ade/install_ade.sh
```
With this you should have setup your ade environment. **Restart the terminal!**

To be able to download the MOLISENS docker iamge you need to login in to the [GitHub registry](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry#authenticating-with-a-personal-access-token-classic) with a [personal access token](https://github.com/settings/tokens):
```bash
export CR_PAT=YOUR_TOKEN
echo $CR_PAT | docker login ghcr.io -u USERNAME --password-stdin
```

### Notes on the installation on MacOS

1) Install ade for mac first see: https://ade-cli.readthedocs.io/en/latest/install.html
2) Do everything from above.
3) run molisens_ade_enter
4) to every described in MOLISENS/molisens_ws/src/drivers/smartmicro_ros2_radars/Readme.md under the ARMv8 Support section
5) run molisens_make inside the ade container


## Usage

You can now enter the MOLISENS/MOSEP ADE environment with the command:
```bash
molisens_ade_enter
```

To stop ADE you need to execute outside of ADE:
```bash
molisens_ade_stop
```
