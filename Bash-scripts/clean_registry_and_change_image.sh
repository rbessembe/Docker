#!/bin/bash

echo "#### Stage 1 - Clearing images from registry ####"
docker run --net docker-registry_default --rm --link registry --name cli anoxis/registry-cli -r ${REGISTRY_HOST} -l ${REGISTRY_USER}:${REGISTRY_PASS} -i $1 --delete --num 1
echo "Clearing done..."

echo "#### Stage 2 - Actions with docker ####"
docker-compose -f /home/centos/test-app/docker-compose.yaml down && echo "Stopping containers..."
image=$1 yq -i '.services.test_app.image = strenv(image)' /home/centos/test-app/docker-compose.yaml && echo "Changing image..."
docker-compose -f /home/centos/test-app/docker-compose.yaml up -d && echo "Starting containers..."
