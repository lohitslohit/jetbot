cp /etc/apt/trusted.gpg.d/jetson-ota-public.asc ../.. # copy to jetbot root


if [[ "$L4T_VERSION" == "32.6.1" ]]
then
    BASE_IMAGE=nvcr.io/nvidia/l4t-pytorch:r32.6.1-pth1.9-py3
elif [[ "$L4T_VERSION" == "32.5.0" ]]
then
    BASE_IMAGE=nvcr.io/nvidia/l4t-pytorch:r32.5.0-pth1.7-py3
fi

sudo docker build \
    --build-arg BASE_IMAGE=$BASE_IMAGE \
    --build-arg BASE_IMAGE=$JETBOT_BASE_IMAGE \
    -t $JETBOT_DOCKER_REMOTE/jetbot:base-$JETBOT_VERSION-$L4T_VERSION \
    -f Dockerfile \
    ../..  # jetbot repo root as context
