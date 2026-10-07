## Set up the environment from scratch

### Prerequisites
To run this stack, make sure to install docker by follow the instructions for your OS on the docker website. It is helpful to add your user to the docker group, this may require a system restart.
To reach your website as login.42.fr add the line
> 127.0.0.1	login.42.fr

to you /etc/hosts file.
You will find a example.env file in the srcs directory. Change the values to your prefered ones and save the file as .env in the srcs directory.

### Configuration files
The nginx configuration file is located at srcs/requirements/nginx/conf/nginx.conf  
The mariadb configuration file is located at srcs/requirements/mariadb/conf/default.conf  
The php-fpm configuration file is located at srcs/requirements/wordpress/conf/www.conf  
The worpress configuration file is created by the script srcs/requirements/wordpress/tools/entrypoint.sh by the command "wp config create".

### Secrets
By default passwords will be generated rondomly and stored in the secrets directory.
If you want custom passwords, create the directory named "secrets" at root of this repository and make sure that the 4 files
> mariadb_root_pw.txt
> mariadb_wp_user_pw.txt
> wordpress_admin_pw.txt
> wordpress_user_pw.txt

are present in the secrets directory and not empty.

## Build and launch the project using the Makefile and Docker Compose

Build and run:
> make run

Build only:
> make build

Run only (when build not necessary and secrets present):
> make up

Stop Containers:
> make stop

Remove containers and volumes:
> make down

Remove containers, volumes and images:
> make clean

Remove containers, volumes, images, secrets, and persistent data
> make fclean

Full wipe, rebuild and restart
> make re

It is possible to manage the deployment by using docker compose up and docker compose down in the srcs folder.  
You can also use commands like docker run or docker build to target a specific severice, when in the repective directory.
It is recommended to stick with the make options.

## Use relevant commands to manage the containers and volumes

List conainers, volumes, networks and images
> make status

Inspect a container to see config and enviroment:
> docker inspect [container name]

Open an interactive bash to look inside a container:
> docker exec -it [container name] bash

## Identify where the project data is stored and how it persists
The project data persists through crashes and reboots. Only
> make fclean 

will delete it. The path where it is located on the host system is defined by the docker-compose.yaml file under volumes and then device.
By default this is /home/${USER_LOGIN}/data/.