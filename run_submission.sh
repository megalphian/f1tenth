xhost local:root

docker run --name autodrive_f1tenth_api --rm -it --entrypoint /bin/bash --network=host --ipc=host \
        -v /tmp/.X11-unix:/tmp.X11-umix:rw --env DISPLAY --privileged --gpus all \
        autodriveecosystem/autodrive_f1tenth_api:2024-cdc-cl2-v2