#!/bin/bash

aws ecs run-task \
    --cluster ecs-exec-demo-cluster  \
    --task-definition ecs-exec-demo \
    --network-configuration awsvpcConfiguration="{subnets=[$PUBLIC_SUBNET1, $PUBLIC_SUBNET2],securityGroups=[$ECS_EXEC_DEMO_SG_ID],assignPublicIp=ENABLED}" \
    --enable-execute-command \
    --launch-type FARGATE \
    --tags key=environment,value=production \
    --platform-version '1.4.0' \
    --region $AWS_REGION
