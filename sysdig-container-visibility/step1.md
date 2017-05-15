`docker run --name mysql -e MYSQL_ROOT_PASSWORD='password' -d mysql
docker run --name wordpress1 --link mysql:mysql -d wordpress
docker run --name wordpress2 --link mysql:mysql -d wordpress
docker run --name wordpress3 --link mysql:mysql -d wordpress
docker run --name wordpress4 --link mysql:mysql -d wordpress
docker run --name haproxy -p 80:80 --link wordpress1:wordpress1 --link wordpress2:wordpress2 --link wordpress3:wordpress3 --link wordpress4:wordpress4 -d tutum/haproxy`{{execute}}
