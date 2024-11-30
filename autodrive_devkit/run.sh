# <path-to-ws> is the path to the workspace directory. Use it before the f1tenth volume mount.
# export CL2_WS_DIR=<path-to-ws>
export BRIDGE_PKG_DIR=$(dirname "$0")/../f1tenth_ws/src/sim_league_bridge
export KICP_PKG_DIR=$(dirname "$0")/../f1tenth_ws/src/kinematic-icp

xhost local:root

docker run --name autodrive_f1tenth_api --rm -it --entrypoint /bin/bash --network=host --ipc=host \
        -v $BRIDGE_PKG_DIR:/home/autodrive_devkit/src/sim_league_bridge:rw  \
        -v $KICP_PKG_DIR:/home/autodrive_devkit/src/kinematic-icp:rw  \
        -v /tmp/.X11-unix:/tmp.X11-umix:rw --env DISPLAY --privileged --gpus all \
        autodriveecosystem/autodrive_f1tenth_api:2024-cdc-cl2-v2