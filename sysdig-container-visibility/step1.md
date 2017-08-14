In this scenario, you will explore a two instances Wordpress deployment with an HAproxy load-balancer and a MySQL database. All services will be deployed using Docker containers.

## Setup scenario

To begin, execute the following commands to launch the scenario:

`docker run --name mysql -v /data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD='password' -d mysql
docker run --name wp1 -e VIRTUAL_HOST=wp --link mysql:mysql -d wordpress
docker run --name wp2 -e VIRTUAL_HOST=wp --link mysql:mysql -d wordpress
docker run --name proxy -p 80:80 -e DEFAULT_HOST=wp -v /var/run/docker.sock:/tmp/docker.sock:ro -d jwilder/nginx-proxy:alpine`{{execute}}

Automatically, a background script will setup Wordpress and start making requests against the Wordpress load balancer so we can simulate some live connections and traffic.
