#!/bin/bash

echo "Terraform validate"
cd terraform/stage
terraform init -backend=false
terraform validate
tflint
cd ../prod
terraform init -backend=false
terraform validate
tflint
