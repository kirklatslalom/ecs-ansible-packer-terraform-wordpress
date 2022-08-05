#!/bin/bash

aws --profile 808768689561 ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 808768689561.dkr.ecr.us-east-1.amazonaws.com

docker pull 808768689561.dkr.ecr.us-east-1.amazonaws.com/metaphordriveway-serverless-wordpress
