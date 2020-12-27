#! /bin/bash


# lms image tag
# (Nightly)
VERSION=8.2.0-1609049500
DOCKERHUBUSER=baztian
REPONAME=armhf-lms

# docker image to build
IMAGE_NAME=$DOCKERHUBUSER/$REPONAME:$VERSION

# build runtime
docker build -t $IMAGE_NAME .

# push to docker hub
docker push $IMAGE_NAME
