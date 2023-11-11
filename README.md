# qubic-mine

запуск майнинга с помощью docker compose (в таком способе контейнер будут самовозрождаться в случае гибели, или перезагрузки сервера)
1) устанавливаем докер композ, для убунты https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04
2) открываем файл Dockerfile -меняем под себя - колво потоков CPU, идентификатор пула, алиас. Сохраняем.
3) выполняем команду docker compose up -d
4) майнинг идет

Запуск майнинга с помощью docker
1) устанавливаем докер apt install docker.io
2) открываем файл Dockerfile -меняем под себя - колво потоков CPU, идентификатор пула, алиас. Сохраняем.
3) создаем образ docker build -t qub .
4) запускаем контейнер из образа docker run -d --name qub qub

так же в репозитории есть вотчдог

start_konteyner.sh		- запуск контейнера + запуск WatchDOG (нужно прописать его запуск в crontab -e см. ниже)

Attach_to_WatchDOG.sh		- подключиться к процессу WatchDOG

Start_WatchDOG_in_SCREEN.sh	- Запуск WatchDOG, если вдруг нечаянно остановил screen с ним

watchdog_CPU.sh			- сама програмка вачдог, делает 35 попыток проверки, если нагрузка на проц снизилась ниже 35% далее идет reboot 

Прописывание автозапуска:

crontab -e

далее пишем:

@reboot /qub/start_konteyner.sh

и сохраняемся
