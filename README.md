# Virtual Vehicle Research / MOLISENS - ADE (agile development environment)

## Docker
```
sudo apt install docker.io
sudo groupadd docker
sudo usermod -aG docker ${USER}
```



## Installation (optional)

!!! During the installation, the repo is already cloned and ADE installed. !!!

To use the MOLISENS docker container with ADE you need the following commands to set it up:
```
export MOLISENS_DIR="$HOME/projects/MOLISENS"
mkdir -p $MOLISENS_DIR
git clone  https://gitlab.v2c2.at/molisens/development/ade.git $MOLISENS_DIR/ade
$MOLISENS_DIR/ade/install_ade.sh
```
With this you should have setup your ade environment. **Restart the terminal!**

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



## Troubleshooting

If there is a problem donloading the MOLISENS docker container image, maybe you need to use the following command to get access first:
```
docker login registry-gitlab.v2c2.at
```

