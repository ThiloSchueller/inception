CONTAINERS := nginx mariadb wordpress
all: run

build:
	cd ./srcs && docker-compose build --no-cache

run: build secrets
	cd ./srcs && docker-compose up # -d ?

stop:
	cd ./srcs && docker-compose down #-v

secrets:

clean: stop
	docker stop $(CONTAINERS)
	docker system prune
	
fclean: stop
	docker rmi $(CONTAINERS)

re: fclean all

.PHONY: all build run stop clean fclean re secrets
