Sysdig works by capturing system calls being made within the Linux Kernel. This provides Sysdig with unique visibility into how applications are operating and highlight key metrics to aid debugging and monitoring of systems.

Sysdig can operate both on the real-time data from a system, or on previously captured data. This allows users to debug in real-time, but also capture data that can be processed at a later date or shared with other members of the team.

## Task

In this scenario, you will take on the role of a developer who is responsible for identifying how a two-node Wordpress and MySQL cluster operates.

To begin, execute the following commands to create a load balanced Wordpress deployment backed by MySQL.

`docker run --name mysql -v /data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD='password' -d mysql
docker run --name wp1 -e VIRTUAL_HOST=wp --link mysql:mysql -d wordpress
docker run --name wp2 -e VIRTUAL_HOST=wp --link mysql:mysql -d wordpress
docker run --name proxy -p 80:80 -e DEFAULT_HOST=wp -v /var/run/docker.sock:/tmp/docker.sock:ro -d jwilder/nginx-proxy:alpine
sleep 2
docker exec -i mysql mysql -ppassword wordpress < wp.sql 2>/dev/null`{{execute}}

Once started, all HTTP requests to our Docker host will be responded to by Wordpress.
