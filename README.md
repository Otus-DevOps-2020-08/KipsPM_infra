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

#Homework 5

1. To start packer template:
packer build -var-file=variables.json ./ubuntu16.json
2. Fake variables in variables.json.example
3. To start baked packer template:
packer build -var-file=variables.json ./immutable.json
4. To start VM with baked template use config-scripts/create-reddit-vm.sh
yc compute instance create \
name reddit-full-instance \
hostname reddit-full-instance \
memory=4 \
create-boot-disk image-family=reddit-full,size=10GB \
network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
metadata serial-port-enable=1 \
ssh-key ~/.ssh/appuser.pub

#Homework 6
1. main.tf contains code to create VM instnces
2. lb.tf contains code to create LB and target group for LB.
3. variables.tf contains (u will not believe) varibles ;) terraform.tfvars.example contains fake info.
4. outputs.tf contain output information: IP-address of LB and VM's.
5. Я использовал count, чтобы можно было горизонтально масшабировать окружение. Пришлось сильно повозиться с ошибкой цикла, проблема оказалась в настройке сетевого доступа.

#Homework 7
1. Добавлено удаленное хранение файла состояния в Yandex Storage. Файл для прода лежит в корне, а для стейджа в папке stage. Был создан сервисный аккаунт для доступа в хранилище.
2. Добавил провижионеры для создания виртуалок сразу с работающим приложением. с помощью переменной db_url.
3. db_url передается в puma.service перед установкой и запуском.
4. Благодаря слаку заранее добавил пустышки vpc и storage-bucket.tf просто чтобы пройти Травис тесты.

#Homework 8
1. Установлен ansible.
2. Развернуто stage окружение.
3. Stage у меня был сразу с приложением, поэтому сразу опробовал команду ansible app -m command -a 'rm -rf ~/reddit'
Не хватало прав, добавил в команду sudo.
4. Для задания со звездочкой воспользовался возможностями терраформ. Добавил в outputs.tf код для заполнения файла inventory.json, а с помощью provider.local заполнил inventory.json в папке с ansible.
Таким образом при разворачивании окружения необходимые адреса попадают в json, команда ping проходит.

#Honework 9
1. Настроено несколько видов плейбуков (с тэгами и без).
2. Настроен провижининг в пакер с помощью ansible. Документация немного устаревшая так как циклы уже deprecated. Воспользовался рекомендованным вариантом.
Также стоит обратить внимание, на добавление ключа и репозитория при провижионинге db.
3. Задание со звездочкой уже было сделано в предыдущем ДЗ с помощью возможностей терраформ.

#Homework 10
1. С помощью galaxy созданы структуры для ролей app и bd.
2. Описаны роли для БД и приложения.
3. Настроены environment для окружений stage и прод.
4. Реорганизована папка с ansible.
5. Использована коммьюнити роль для установки nginx.
6. Зашифровано 2 чувствительных файла с помощью ansible vault.
7. Для первого задания со звездочкой переиспользовано динамическое инвентори для окружений stage и prod.
8. Для второго задания со звездочкой в файл .travis.yml был добавлен вызов скриптов ansible_validate.sh, packer_validate.sh, terraform.sh. Все проверки успешно пройдены с 25 раза :)

#Homework 11
1. Установлен vagrant.
2. Переработаны роли для провижионинга в Vagrant.
3. Выполнено задание со звездочкой для доступа к приложению по 80 порту через nginx.
4. Установлены molecule, testinfra. Молекула нужна версии 2.х
5. Настроены тесты для молекулы, протестирована роль db.
6. Настроена сборка Packer'ом с использование ролей app и db.
ansible-playbook playbooks/packer_db.yml --limit db --tags install
ansible-playbook playbooks/packer_app.yml --limit app --tags ruby
packer build -var-file=packer/variables.json packer/db.json
packer build -var-file=packer/variables.json packer/app.json
7. Второе задание со звездочкой сделать не представляется возможным из-за отсутствия драйвера молекулы для Яндекса.
