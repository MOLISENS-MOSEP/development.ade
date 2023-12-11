# Virtual Vehicle Research / MOLISENS - ADE (agile development environment)

## Docker
```bash
sudo apt install docker.io
sudo groupadd docker
sudo usermod -aG docker ${USER}
```



## Installation

!!! During the installation, the repo is already cloned and ADE installed. !!!

To use the MOLISENS docker container with ADE you need the following commands to set it up:

Execute and add the following line to your .zprofile or .bashrc
```bash
export MOLISENS_DIR="WHEREVER_YOU_WANT/MOLISENS"
```

WHEREVER_YOU_WANT is the folder where you want to install ade and the MOLISENS repos. For example:
```bash
export MOLISENS_DIR="/home/$USER/projects/MOLISENS"
```

Now you can execute the following commands to install the MOLISENS ADE:
```bash	
mkdir -p $MOLISENS_DIR
git clone  https://gitlab.v2c2.at/molisens/development/ade.git $MOLISENS_DIR/ade
$MOLISENS_DIR/ade/install_ade.sh
```
With this you should have setup your ade environment. **Restart the terminal!**

To be able to download the MOLISENS docker iamge you need to login in to the Gitlab registry:
```bash
docker login registry-gitlab.v2c2.at
```

## Installation MacOS

1) Install ade for mac first see: https://ade-cli.readthedocs.io/en/latest/install.html
2) Do everything from above.
3) run molisens_ade_enter
4) to every described in MOLISENS/molisens_ws/src/drivers/smartmicro_ros2_radars/Readme.md under the ARMv8 Support section
5) run molisens_make inside the ade container

## Usage

You can now enter the VIFWARE ADE with the command:
```bash
molisens_ade_enter
```

To stop ADE you need to execute outside of ADE:
```bash
molisens_ade_stop
```


