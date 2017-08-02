The previous steps have focused on using full output and chisels together with filters to gain insight into the system activity. It's also possible to use the Sysdig console interface called `csysdig`, a powerful but simple and intuitive curses UI for sysdig.

`csysdig` can be understood as a combination of popular tools like `strace`, `tcpdump`, `lsof`, etc with a UI similar to `htop`. Unlike `htop`, `csysdig` has multiple views available for different troubleshooting scenarios:

- Containers
- Container Errors
- Kubernetes-based views
- Mesos-based views
- Network activity (by container, host, and process)
- File Activities
- Processes Activity / CPU / Memory / File
- Threads
- Log activity
- User Activity
- Traces
- Spectrograms

Launch the UI by running the command `csysdig`{{execute}}. Driven by keyboard shortcuts, the views menu can be accessed using <kbd>F2</kbd>. Select the option using arrow keys and press <kbd>Enter</kbd> to select the required view.

On each view you will be able to see different columns explained as you browse between the views, for example on the 'Containers' view you can see CPU, process count, memory, file I/O or network by container name and id. You can always select any of the rows and you will start filtering by that container, you will then see the processes inside them.

To learn more about `csysdig` we recommend checking out [csysdig explained visually](https://sysdig.com/blog/csysdig-explained-visually/).
