#!/bin/bash

echo "Validate packer"
cd packer
packer validate -var-file=variables.json.example app.json
packer validate -var-file=variables.json.example db.json
packer validate -var-file=variables.json.example immutable.json
packer validate -var-file=variables.json.example ubuntu16.json
