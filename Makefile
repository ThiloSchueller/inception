CONTAINERS := nginx mariadb wordpress
all: run

build:
	cd ./srcs && docker-compose build #--no-cache

run:	secrets
	cd ./srcs && docker-compose up

stop:
	cd ./srcs && docker-compose down #-v

secrets:

clean: stop
	docker container prune
	docker rmi $(CONTAINERS)
fclean: stop

re: fclean all

.PHONY: all build run stop clean fclean re secrets
