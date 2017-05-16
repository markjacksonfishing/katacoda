Sysdig works by


## Task

Execute the following commands to create a load balanced Wordpress deployment backed by MySQL

`docker run --name mysql -v /data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD='password' -d mysql
docker run --name wp1 -e VIRTUAL_HOST=wp --link mysql:mysql -d wordpress
docker run --name wp2 -e VIRTUAL_HOST=wp --link mysql:mysql -d wordpress
docker run --name proxy -p 80:80 -e DEFAULT_HOST=wp -v /var/run/docker.sock:/tmp/docker.sock:ro -d jwilder/nginx-proxy:alpine`{{execute}}
