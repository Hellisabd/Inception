all : run_script_nginx run_script_mariadb run_script_wp

nginx : run_script_nginx

maria : run_script_mariadb

clean :
		@docker ps -q | xargs -r docker stop
		docker container prune -f
		@docker images -q | xargs -r docker rmi -f

run_script_nginx : ./src/requirements/NGINX/docker.sh
	chmod +x ./src/requirements/NGINX/docker.sh
	./src/requirements/NGINX/docker.sh

run_script_mariadb : ./src/requirements/Mariadb/docker.sh
	chmod +x ./src/requirements/Mariadb/docker.sh
	./src/requirements/Mariadb/docker.sh

run_script_wp : ./src/requirements/WordPress/docker.sh
	chmod +x ./src/requirements/WordPress/docker.sh
	./src/requirements/WordPress/docker.sh
