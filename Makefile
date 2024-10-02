all : run_script

run_script : ./src/NGINX/docker.sh
			chmod +x ./src/NGINX/docker.sh
			./src/NGINX/docker.sh