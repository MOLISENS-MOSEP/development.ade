# Virtual Vehicle Research / MOLISENS - ADE (agile development environment)

## Docker
```
sudo apt install docker.io
sudo groupadd docker
sudo usermod -aG docker ${USER}
```



## Installation

!!! During the installation, the repo is already cloned and ADE installed. !!!

To use the MOLISENS docker container with ADE you need the following commands to set it up:

Create the environment variable to where you want your molisens directory to be
```
export MOLISENS_DIR="WHEREVER/YOU/WANT"
```

WHEREVER_YOU_WANT is the folder where you want to install ade and the MOLISENS repos.

```
mkdir -p $MOLISENS_DIR
git clone  https://gitlab.v2c2.at/molisens/development/ade.git $MOLISENS_DIR/ade
$MOLISENS_DIR/ade/install_ade.sh
```
With this you should have setup your ade environment. **Restart the terminal!**

## Installation MacOS

1) Install ade for mac first see: https://ade-cli.readthedocs.io/en/latest/install.html
2) Do everything from above.
3) run molisens_ade_enter
4) to every described in MOLISENS/molisens_ws/src/drivers/smartmicro_ros2_radars/Readme.md under the ARMv8 Support section
5) run molisens_make inside the ade container

## Usage

To download the VIFWARE docker you need to login in first:
```
docker login registry-gitlab.v2c2.at
```
You can now enter the VIFWARE ADE with the command:
```
molisens_ade_enter
```
To stop ADE you need to execute outside of ADE:
```
molisens_ade_stop
```

## Uninstallation

To uninstall all the changes made to your system during this installation process, execute 

```
$MOLISENS_DIR/ade/unininstall_ade.sh
```

## Troubleshooting

If there is a problem donloading the MOLISENS docker container image, maybe you need to use the following command to get access first:
```
docker login registry-gitlab.v2c2.at
```

