#!/bin/bash

# set up an ecr repo
aws ecr create-repository --repository-name python-dev-sam-app \
--image-tag-mutability IMMUTABLE --image-scanning-configuration scanOnPush=true