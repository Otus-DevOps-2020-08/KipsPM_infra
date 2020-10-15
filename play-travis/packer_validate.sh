#!/bin/bash

echo "Validate packer"
set -v
cd packer
packer validate -var-file=variables.json.example immutable.json
packer validate -var-file=variables.json.example ubuntu16.json
cd ..
packer validate -var-file=packer/variables.json.example packer/app.json
packer validate -var-file=packer/variables.json.example packer/db.json
