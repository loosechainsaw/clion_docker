#!/bin/bash
docker build  --no-cache --build-arg uid="$1" --build-arg username="$2" --build-arg passwd="$3" -t "clion:jetbrains-bionic-1.0.0" .

