#!/bin/sh
# Sync gitea state to Remote S3 bucket
SOURCE_DATA_DIR=$(pwd)
export AWS_PROFILE=blpsaml
s3_name_prefix=s3://boar-bot-2023-ap-northeast-1/ecs_demo

#Gitea instance
aws s3 sync ${SOURCE_DATA_DIR}/gitea_data ${s3_name_prefix}/gitea_data/
aws s3 sync ${SOURCE_DATA_DIR}/nginx_config ${s3_name_prefix}/nginx_config/
aws s3 sync ${SOURCE_DATA_DIR}/cert ${s3_name_prefix}/cert/
