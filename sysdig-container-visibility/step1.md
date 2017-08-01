In this scenario, you will take on the role of a DevOps team member who is responsible of identifying how a Wordpress service performs running in two Docker containers with a MySQL database also in a container. An HAproxy will sit in front of the Wordpress containers balancing the requests between both. 

## Task

To begin, execute the following commands to create the scenario:

`docker run --name mysql -v /data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD='password' -d mysql
docker run --name wp1 -e VIRTUAL_HOST=wp --link mysql:mysql -d wordpress
docker run --name wp2 -e VIRTUAL_HOST=wp --link mysql:mysql -d wordpress
docker run --name proxy -p 80:80 -e DEFAULT_HOST=wp -v /var/run/docker.sock:/tmp/docker.sock:ro -d jwilder/nginx-proxy:alpine
sleep 5
docker exec -i mysql mysql -ppassword wordpress < wp.sql 2>/dev/null`{{execute}}

Once started, all HTTP requests to our Docker host will be forwarded by HAproxy to by one of the Wordpress instances. Automatically, a background script on this scenario will start making requests against the Wordpress load balancer so we can simulate some live connections and traffic.
