#!/bin/bash
 docker run --network host --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --env="DISPLAY" --env="QT_X11_NO_MITSHM=1"  --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --name clion-jetbrains clion:jetbrains-bionic-1.0.0
