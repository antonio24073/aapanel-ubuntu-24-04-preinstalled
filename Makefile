include ./.env
export

build:
	- docker build -t ${REPO} ./docker-file

build_verbose:
	- docker build --progress=plain -t ${REPO} ./docker-file

build_no_cache:
	- docker build --no-cache -t ${REPO} ./docker-file

commit:
	- docker commit ${STACK} ${REPO_PUBL};

push:    
	- echo ${DOCKERHUB_PASS} | docker login -u ${DOCKERHUB_USER} --password-stdin
	- docker push ${REPO}

mkdir:
	- sudo mkdir -p ./vol/www/wwwroot
	- sudo mkdir -p ./vol/www/server/data
	- sudo mkdir -p ./vol/www/server/panel/vhost
	- sudo mkdir -p ./vol/www/server/panel/data
	- sudo mkdir -p ./vol/www/wwwlogs
	- sudo mkdir -p ./vol/www/backup
	- sudo mkdir -p ./vol/etc
	- make --no-print-directory run
	- sudo docker cp ${STACK}:/www/wwwroot ./vol/www
	- sudo docker cp ${STACK}:/www/server/data ./vol/www/server
	- sudo docker cp ${STACK}:/www/server/panel/vhost ./vol/www/server/panel
	- sudo docker cp ${STACK}:/www/server/panel/data ./vol/www/server/panel
	- sudo docker cp ${STACK}:/www/wwwlogs ./vol/www/wwwlogs
	- sudo docker cp ${STACK}:/www/backup ./vol/www/backup
	- sudo docker cp ${STACK}:/etc/hosts ./vol/etc/hosts
	- sudo docker cp ${STACK}:/etc/resolv.conf ./vol/etc/resolv.conf
	- sudo cp -r ./docker-file/provision ./vol
	- make --no-print-directory fix_permissions_dev
	- docker rm ${STACK} -f

fix_permissions_prod:
	- sudo chown 1001:1002 -R ./vol

fix_permissions_dev:
	- sudo chown $$USER:1002 -R ./vol
	- sudo chmod 775 -R ./vol

rmdir:
	- sudo rm -Rf ./vol/

run:
	- docker run --name ${STACK} -d -p ${AAP_PORT}:7800 -p ${FTP_PORT}:21 -p ${SSH_PORT}:22 \
	-p ${HTTPS_PORT}:443 -p ${HTTP_PORT}:80 -p ${PMA_PORT}:888 ${REPO}

up:
	- docker compose -p ${STACK} -f "./docker-compose.yml" up -d
	

rm:
	- docker rm ${STACK} -f
