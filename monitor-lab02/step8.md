From the captures tab, we have access to all of the captures that were taken by Sysdig Monitor. We can open that with Sysdig Inspect, which is an interface built specifically for container troubleshooting, inspired by popular debugging tools like Wireshark.

Captures can be also downloaded to your device. In this case Sysdig Inspect can also be installed in your desktop, or you can use open source sysdig CLI or csysdig for analysis of the capture file. But for practical reasons will use the online version here.

Let's open the linked capture (`sql-error.scap`) from the captures tab:

![Capture files](/sysdig/scenarios/monitor-lab02/assets/image15.png)

Sysdig Inspect will open and we can see an overview. Each of these tiles aggregate different activities including file system and network, application protocols traffic, security events, performance indicators and logs.

This is how we are going to be able to navigate through thousands system calls recorded in this capture file, so from a fired alert you can drill down and recreate everything that happened: modified files, network connections and executed commands. Using the sliders we can narrow our search around a specific time frame if we want.

A good candidate to start the debugging is the "postgresql Bytes" tile (top middle, NETWORK APPS column):

![Tiles](/sysdig/scenarios/monitor-lab02/assets/image16.png)

Let's drill down on that tile (hover over the tile and click on the two downward arrows).

The connection section in the context of "postgres bytes" show us two processes:

![Postgres Bytes](/sysdig/scenarios/monitor-lab02/assets/image17.png)

We already know that the result pods and the nodejs process in particular were causing the SQL errors.

Let's drill down in any of those process extracting the raw SQL I/O stream (click on a process row and then the I/O Stream button on your bottom left).

![I/O Stream](/sysdig/scenarios/monitor-lab02/assets/image18.png)

Blue rows mean that we are sending a message (write syscall) while the orange row represent a received message (read syscall).

You will immediately pinpoint the SQL error: our clients are requesting a table "vote" that does not exist, the previous service version was using the "votes" table.

This time is not much more complex than a typo error, but you have been able to detect and troubleshoot a SQL syntax error without actually having to instrument the client nor the SQL server.
