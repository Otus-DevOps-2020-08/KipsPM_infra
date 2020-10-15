#!/bin/bash

touch ~/.ssh/appuser.pub && touch ~/.ssh/appuser
#cd /tmp
#curl -O https://releases.hashicorp.com/packer/${PACKER_VER}/packer_${PACKER_VER}_linux_amd64.zip
#unzip packer_${PACKER_VER}_linux_amd64.zip
#rm /tmp/packer_${PACKER_VER}_linux_amd64.zip
#sudo  mv /tmp/packer /usr/bin
#sudo chmod +x /usr/bin/packer
#curl -O https://releases.hashicorp.com/terraform/${TERRAFORM_VER}/terraform_${TERRAFORM_VER}_linux_amd64.zip
#unzip terraform_${TERRAFORM_VER}_linux_amd64.zip
#rm /tmp/terraform_${TERRAFORM_VER}_linux_amd64.zip
#sudo mv /tmp/terraform /usr/bin
#chmod +x /usr/bin/terraform
#curl -OL https://github.com/wata727/tflint/releases/download/v${TFLINT_VER}/tflint_linux_amd64.zip
#unzip tflint_linux_amd64.zip
#rm /tmp/tflint_linux_amd64.zip
#sudo mv /tmp/tflint /usr/bin
#sudo chmod +x /usr/bin/tflint
#sudo apt-get install -yqq python-pip
#sudo -H python -m pip install -q --upgrade pip setuptools wheel
#sudo pip install ansible==${ANSIBLE_VER} ansible-lint==${ANSLINT_VER}
packer validate -var-file=packer/variables.json.example packer/app.json
packer validate -var-file=packer/variables.json.example packer/db.json
packer validate -var-file=packer/variables.json.example packer/immutable.json
packer validate -var-file=packer/variables.json.example packer/ubuntu16.json
cd ansible
ansible-lint playbooks/site.yml --exclude=roles/jdauphant.nginx
cd terraform/stage
terraform init -backend=false
terraform validate
tflint
cd terraform/prod
terraform init -backend=false
terraform validate
tflint
echo "please"
