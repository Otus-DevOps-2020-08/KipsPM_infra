#!/bin/bash

echo "Ansible validate"
cd ansible
ansible-lint playbooks/site.yml --exclude=roles/jdauphant.nginx
