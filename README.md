# KipsPM_infra
KipsPM Infra repository

#HomeWork #3:
Домашнее задание к лекции 5:
1. Подключение к виртуалке без внешнего адреса в одну строку через бастион:
ssh -i ~/.ssh/id_rsa_yandex -AJ  appuser@178.154.226.155 appuser@10.130.0.11


2. Подключение к виртуалке без внешнего адреса через алиас someinternalhost. Для этого ноебходимо внести следующую информацию в конфиг ~/.ssh/config:
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

3.Для запуска VPN установил iptables
домен с сертификатом: https://178.154.226.155.sslip.io/
bastion_ip = 178.154.226.155 someinternalhost_ip = 10.130.0.11
