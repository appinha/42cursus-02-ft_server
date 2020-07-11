# 42cursus' ft_server

Development repo for 42cursus' **ft_server** project.

For further information about **42cursus** and this project, please refer to [42cursus repo](https://github.com/appinha/42cursus).

## Contents

* **files in the root:** source code developed for the project.


## Study Summary

### Docker

[**Docker**](https://www.docker.com/) is a solution for the management of lightweight process containers.

An **image** is an object that you can download and reuse to instantiate new containers. Ready-made images are provided in Docker's official repositories (their "official images"), the [Docker Hub](https://hub.docker.com/).

**Docker commands:**

* `docker build -t [image_name]` - Build an image from a Dockerfile (in current location).
* `docker images` - List all docker images.
* `docker run --name [container_name] image` - Start a container from an image, with a custom name.
* `docker start|stop [container_name]` - Start or stop an existing container.
* `docker ps` - List **currently running** docker containers.
* `docker ps -a` - List **all** docker containers (running and stopped).
* `docker exec -it [container_name] sh` - Open a shell inside of an already running container.
* `docker rm [container_name]` - Remove a stopped container.

Reference: [Docker Documentation - CLI](https://docs.docker.com/engine/reference/commandline/cli/)

### NGINX

[**NGINX**](https://docs.nginx.com/nginx/admin-guide/installing-nginx/installing-nginx-open-source/?_ga=2.203137169.148315847.1594301020-870972343.1594301020) (read as "engine-x"	) is a lightweight, high-performance web server designed for high-traffic use cases.

### Useful Links

* [Docker](https://www.docker.com/)
* [Docker Documentation](https://docs.docker.com/get-started/)
* [Docker Hub](https://hub.docker.com/) (image repository)

* [Debian image](https://hub.docker.com/_/debian) from Docker Hub
* [Debian wiki](https://wiki.debian.org/Docker)

* [LEMP (Linux, (E)NGINX, MySQL, PHP) stack tutorial](https://www.linuxbabe.com/debian/install-lemp-stack-debian-10-buster)

* [NGINX (open source version)](https://docs.nginx.com/nginx/admin-guide/installing-nginx/installing-nginx-open-source/?_ga=2.203137169.148315847.1594301020-870972343.1594301020)
* [NGINX configuration](https://www.linode.com/docs/web-servers/nginx/how-to-configure-nginx/)
* [NGINX redirection from HTTP to HTTPS (SSL)](https://www.hostinger.com.br/tutoriais/nginx-redirect-http-to-https/)


