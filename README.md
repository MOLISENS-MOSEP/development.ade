# Virtual Vehicle Research / VIFWARE - ADE (agile development environment)

## Docker
```
sudo apt install docker.io
sudo groupadd docker
sudo usermod -aG docker ${USER}
```

## Nvidia 

If you have on your machine a NVIDIA GPU you need to install NVIDIA docker 2. You can find details at following website or execute the following instructions:
https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html


```
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
   && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
   && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list


sudo apt-get update
sudo apt-get install -y nvidia-docker2

sudo systemctl restart docker
```

## Installation (optional)

!!! During the installation, the repo is already cloned and ADE installed. !!!

To use the VIFWARE docker container with ADE you need the following commands to set it up:
```
export VIFWARE_DIR="$HOME/projects/SHOW"
mkdir -p $VIFWARE_DIR
git clone  https://gitlab.v2c2.at/vifware/development/projects/show_ade.git $VIFWARE_DIR/show_ade
$VIFWARE_DIR/show_ade/install_ade.sh
```
With this you should have setup your ade environment. **Restart the terminal!**

## Usage

To download the VIFWARE docker you need to login in first:
```
docker login registry-gitlab.v2c2.at
```
You can now enter the VIFWARE ADE with the command:
```
ade_enter
```
To stop ADE you need to execute outside of ADE:
```
ade_stop
```

# Get started! Start the planning simulator
```
roslaunch autoware_launch planning_simulator.launch
```


## Troubleshooting

If there is a problem donloading the VIFWARE docker container image, maybe you need to use the following command to get access first:
```
docker login registry-gitlab.v2c2.at
```

