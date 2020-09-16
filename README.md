# KipsPM_infra
#Homework 4
testapp_IP = 178.154.227.77
testapp_port = 9292

1. Created scripts for autoinstall:
deploy.sh
install_ruby.sh
install_mongodb.sh

2. Autoinstall via metadata.yaml:
yc compute instance create \
  --name reddit-app2 \
  --hostname reddit-app2 \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --metadata-from-file user-data=./metadata.yaml


bastion_IP = 178.154.226.155
someinternalhost_IP = 10.130.0.11
