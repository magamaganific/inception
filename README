*This project has been created as part of the 42 curriculum by mfornovi*

# Description
Inception is an introduction to the world of containers. Requirinf us to learn what Wordpress, Mariadb and Nginx are and how to interconect them using Dockerfiles and Docker-compose. Ultimately the goal of this project is to create a functioning webpage with the help of those services.

### Services summary:
* Wordpress is a service with containers that allow you to organize and structure the content of your webpage.
* MariaDB is adatabase management system that Wordpress uses, an open source alternative to another one called MySQL (by the same creators, so they share a lot of their code and syntax).
* Nginx "is an HTTP web server, reverse proxy, content cache, load balancer, TCP/UDP proxy server, and mail proxy server." (nginx.org). This is the one you use to setup network ports and SSL keys and certificates.

### Dockerfiles:
You use them to setup everything you need for your services to work.

### Docker-compose:
A file that serves to save time in the compilation of Dockerfiles by organizing the service dependencies and defining the necesary variables all in a single file instead of having to set them up through a lot of "docker" commands in terminal.

Think of it as a recipe that the "docker compose \<files> build" command reads to compile and setup everything for you.

# Instalation

Clone the repository and copy its contents to a virtual machine shared folder (mine is called "inception"). Copy my ".env" file to the folder as well if it's not already there.

Start the virtual machine, go to the shared folder and enter the super user in a terminal. Now you can start the proyect:

	$ make 
		// will setup the webpage
	$ make up 
		// will setup the page if its not already and upload it to the internet (making it accessible through a browser)
	$ make down
		// will pull the webpage out of the internet keeping the saved data (such as posts).
	$ make fclean
		// will pull the webpage and erase all the data.

# Resources

As I was adviced by my peers:

I used barci1999's code as a reference (https://github.com/barci1999/inception/tree/main)

I read a lot to try to understand what I was doing:

* https://dev.to/prodevopsguytech/writing-a-dockerfile-beginners-to-advanced-31ie
* https://wpengine.com/blog/containers-clusters-wordpress/
* https://aws.amazon.com/es/compare/the-difference-between-mariadb-vs-mysql/
* https://www.ionos.com/digitalguide/hosting/blogs/wordpress-nginx/
* https://medium.com/@mrdevsecops/dockerfile-nginx-842ba0a55b82

And ended up folding to using Claude AI (despite my distaste) to find some pestering errors I that were messing up my entire code execution. It found I had been using Mariadb's health check wrong, Wordpress wasn't waiting for the darn healthcheck to finish, and I was missing a god damned opening apostrophe somewhere.
# Project description

### Virtual machines vs Docker

Virtual machines run a full operating syste with dedicated resources and provide complete isolation from the rest of your computer. They require a lot of disk space.

Meanwhile, Docker runs containers that share the Host's OS, so they are much lighter and portable.

### Secrets vs Environment Variables
Secrets keep sensitive data like passwords stored securely and only accesible by the revices that needd them.

The environment variables store configurationn values that can be accessed by apps, but are less secure than secrets.
### Docker network vs Host network
* Docker Network: Creates an isolated virtual network for containers, allowing them to communicate with each other securely while controlling which ports are exposed to the host.
* Host Network: Makes a container share the host machine’s network stack, giving the container direct access to the host’s IP addresses and ports, but with less isolation.
### Docker Volumes vs Bind Mounts.
* Docker Volumes: Volumes are managed by Docker and stored in Docker’s directory. They are ideal for persistent data, can be easily backed up, and are portable between containers.
* Bind Mounts: Bind mounts map a directory or file from the host directly into a container. They provide full access to the host filesystem but offer less portability and isolation.
