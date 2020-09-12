# KipsPM_infra
KipsPM Infra repository

#HomeWork #3:
1. Connection to remote host without external IP in 1 string:
ssh -i ~/.ssh/id_rsa_yandex -AJ  appuser@178.154.226.155 appuser@10.130.0.11


2. Changed ~/.ssh/config like this to connect via ssh sominternalhost:
### The Bastion Host
Host bastion
HostName 178.154.226.155
User appuser
ForwardAgent yes
IdentityFile ~/.ssh/id_rsa_yandex
Port 22

### The Remote Host
Host someinternalhost
User appuser
ForwardAgent yes
IdentityFile ~/.ssh/id_rsa_yandex
HostName 10.130.0.11
Port 22
ProxyJump bastion

3.
https://178.154.226.155.sslip.io/   #fixed ssl error via sslip.io
bastion_ip = 178.154.226.155
someinternalhost_ip = 10.130.0.11
