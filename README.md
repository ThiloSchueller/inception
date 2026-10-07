*This project has been created as part of the 42 curriculum by tschulle.*

## Description

In this project the goal is to set up a stack of Nginx, Wordpress and MariaDB. For each there is a Docker image built from Debian:bookworm.
Each application runs in its own container and docker compose is responsible for orchestration of the three services and for setting up the network and the volumes.
A make command can be used to build and deploy in one command.

### Virtual Machines vs Docker

A virtual machine a full-fledged OS running on virtualized hardware. A docker container is more lightweight, because it uses the hosts kernel, often a minimal version of 
an OS and achieves isolation with linux namespaces and cgroups.

### Secrets vs Environment Variables

Both can be used to bring information from the host inside a container. Environment variables are stored in plain text and can be viewed with docker inspect.
Secrets are mounted into the container as read-only files in memory (/run/secrets). Unlike environment variables, they don't show up in docker inspect or in the process environment, and they are never stored in an image layer.

### Docker Network vs Host Network

The host network is the regular network of the host machine and can be used as a setting for containers, so containers share the hosts network stack.
The default network for docker is bridge, where only the containers created by the docker compose file can communicate with each other.

### Docker Volumes vs Bind Mounts

Both are used to store data from containers persistently by storing it in the filesystem of the host. Docker Volumes are typically managed by Docker and are usually found
in /var/lib/docker/volumes. Bind mounts are a way of attaching a directory from the host system to the directory of the container.


## Instructions

To run this stack, make sure to install docker by follow the instructions for your OS on the docker website. It is helpful to add your user to the docker group, this may require a system restart.
To reach your website as login.42.fr add the line
> 127.0.0.1	login.42.fr

to you /etc/hosts file.
You will find a example.env file in the srcs directory. Change the values to your prefered ones and save the file as .env in the srcs directory.
By default passwords will be generated rondomly and stored in the secrets directory.
If you want custom passwords, create the directory named "secrets" at root of this repository and make sure that the 4 files
> mariadb_root_pw.txt
> mariadb_wp_user_pw.txt
> wordpress_admin_pw.txt
> wordpress_user_pw.txt

are present in the secrets directory and not empty.
Then you are ready and can start the stack by simply executing
> make

For more options please refer to DEV_DOC.md and USER_DOC.md.

## Resources
The "Docker for beginners" course from KodeKloud.com and their notes.
https://notes.kodekloud.com/docs/Docker-Training-Course-for-the-Absolute-Beginner/Docker-Engine-Storage/Docker-Storage/page
https://docs.docker.com/
https://nginx.org/en/docs/
https://mariadb.com/docs/
https://spacelift.io/blog/docker-volumes
https://www.php.net/manual/en/index.php
https://developer.wordpress.org/cli/commands/


### AI Disclosure
AI was used to help debugging and to deepen understanding of the concepts of docker and understanding the various config files.