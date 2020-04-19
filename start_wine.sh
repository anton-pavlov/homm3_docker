#!/bin/bash
set -x

if [ `uname` == "Darwin" ]; then
    # Check XQuartz installed
    if ! which xquartz >/dev/null 2>&1; then
        echo "ERROR: XQuartz does not appear to be installed"
        exit 1
    fi

    # Allow localhost to access XQuartz if required
    if ! xhost | grep "INET:localhost" >/dev/null 2>&1; then
        echo "WARNING: Adding localhost to authorized xhost clients"
        xhost + 127.0.0.1
    fi

    if ! which pulseaudio >/dev/null 2>&1; then
        echo "ERROR: PulseAudio does not appear to be installed"
        exit 1
    fi
else
    echo "ERROR: Work only in mac"
    exit 1
fi

docker run -it \
--rm \
--env="DISPLAY=host.docker.internal:0" \
--env="PULSE_SERVER=host.docker.internal:4713" \
--volume="/tmp/.X11-unix:/tmp/.X11-unix:ro" \
--volume="$(pwd)/.wine:/root/.wine" \
--volume="$(pwd)/sources:/root/sources" \
--volume="$HOME/.config/pulse:/root/.config/pulse" \
--hostname="winecellar" \
--name="wine" \
-w /root/ \
--privileged \
wine bash

