## Services provided by the stack

### Nginx
This is the webserver and the entrypoint to this stack.

### MariaDB
This is the database. Wordpress requires one, it will store its data here.

### Wordpress
This is a tool for building a website.

## Start and stop the project

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

To stop it use
> make down

## Access the website and the administration panel
You will be able to visit your website at login.42.fr, if you edited the /etc/hosts file.
Otherwise https://localhost:443 should work aswell.

To log in as admin append
/wp-admin to your URI and login with the credentials you set in the .env file and the password you find in the secrets folder.

To log in as wordpress user append
/wp-login.php to your URI and login with the credentials you set in the .env file and the password you find in the secrets folder.

## Locate and manage credentials.
Credentials are in your .env file, which you have created by now. If not follow these steps:
You will find a example.env file in the srcs directory. Change the values to your prefered ones and save the file as .env in the srcs directory.

## Check that the services are running correctly

Use:
> make status

