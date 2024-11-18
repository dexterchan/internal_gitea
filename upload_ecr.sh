#!/bin/bash
REGION=ap-northeast-1
AWS_REGISTRY=709162806170.dkr.ecr.${REGION}.amazonaws.com
GITEA_VERSION=1.22.3
NGINX_VERSION=1.26.2-alpine-perl
PLATFORM=linux/amd64

aws ecr get-login-password --region ${REGION} | docker login --username AWS --password-stdin ${AWS_REGISTRY}

docker pull --platform ${PLATFORM} gitea/gitea:${GITEA_VERSION}
docker pull --platform ${PLATFORM} nginx:${NGINX_VERSION}

docker tag gitea/gitea:${GITEA_VERSION} ${AWS_REGISTRY}/gitea:${GITEA_VERSION}
docker tag nginx:${NGINX_VERSION} ${AWS_REGISTRY}/nginx:${NGINX_VERSION}
docker push --platform ${PLATFORM} ${AWS_REGISTRY}/gitea:${GITEA_VERSION}
docker push --platform ${PLATFORM} ${AWS_REGISTRY}/nginx:${NGINX_VERSION}