all : 
	mkdir -p /home/bgrosjea/data/wordpress
	mkdir -p /home/bgrosjea/data/mariadb
	echo >> /etc/hosts "127.0.0.1       bgrosjea.42.fr"
	docker-compose -f ./src/docker-compose.yml up -d --build
	docker ps
	docker logs mariadb
	docker logs wordpress
	docker logs nginx

re : clean run_script_wp run_script_nginx 
	docker logs nginx
	docker logs wordpress

nginx : network run_script_nginx

maria : run_script_mariadb

wp : network run_script_wp

network : 
		docker network create wordpress-network

clean :
		@docker-compose -f ./src/docker-compose.yml down
		docker container prune -f
		@docker images -q | xargs -r docker rmi -f

fclean :
		@docker-compose -f ./src/docker-compose.yml down -v
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
