all : network run_script_wp run_script_nginx 
	docker logs nginx
	docker logs wordpress


nginx : network run_script_nginx

maria : run_script_mariadb

wp : network run_script_wp

network : 
		docker network create wordpress-network

clean :
		@docker ps -q | xargs -r docker stop
		docker container prune -f
		@docker images -q | xargs -r docker rmi -f
		@docker network rm wordpress-network || echo

run_script_nginx : ./src/requirements/NGINX/docker.sh
	chmod +x ./src/requirements/NGINX/docker.sh
	./src/requirements/NGINX/docker.sh

run_script_mariadb : ./src/requirements/Mariadb/docker.sh
	chmod +x ./src/requirements/Mariadb/docker.sh
	./src/requirements/Mariadb/docker.sh

run_script_wp : ./src/requirements/WordPress/docker.sh
	chmod +x ./src/requirements/WordPress/docker.sh
	./src/requirements/WordPress/docker.sh
