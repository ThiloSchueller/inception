CONTAINERS := nginx mariadb wordpress
include srcs/.env
all: run

build:
	mkdir -p /home/${USER_LOGIN}/data/db
	mkdir -p /home/${USER_LOGIN}/data/wp
	cd ./srcs && docker compose build --no-cache

run: secrets build
	cd ./srcs && docker compose up -d

up:
	cd ./srcs && docker compose up -d

stop:
	cd ./srcs && docker compose stop

down:
	cd ./srcs && docker compose down -v

status:
	docker container ls
	docker volume ls
	docker network ls
	docker image ls

secrets:
	@if [ ! -d secrets ]; then \
		mkdir -p secrets; \
		openssl rand -base64 16 > secrets/mariadb_root_pw.txt; \
		openssl rand -base64 16 > secrets/mariadb_wp_user_pw.txt; \
		openssl rand -base64 16 > secrets/wordpress_admin_pw.txt; \
		openssl rand -base64 16 > secrets/wordpress_user_pw.txt; \
	fi

clean: down
	-docker rmi $(CONTAINERS)
	
fclean: clean
	rm -rf ./secrets
	rm -rf /home/${USER_LOGIN}/data/db
	rm -rf /home/${USER_LOGIN}/data/wp

re: fclean all

.PHONY: all build run up stop down status secrets clean fclean re