The previous steps have focused on using chisels to gain insight into the system activity. It's also possible to use the Sysdig UI called Csysdig, a simple, intuitive, and fully customizable curses UI for sysdig.

Csysdig leverages the sysdig collection system but exports it in a user interface that you can imagine as a combination of many popular command line monitoring tools: tools like strace, tcpdump, htop, iftop and lsof. Just like sysdig, csysdig natively supports containers - cleanly and elegantly.

Launch the UI by running the command `csysdig`{{execute}}. This provides an overview of the processes running.

The Csysdig application has different views to highlight different aspects of the system. Driven by keyboard shortcuts, the views menu can be accessed using <kbd>F2</kbd>. Select the option using arrow keys and press enter to select the required view.

Alternatively, the view can be launched when running the application, such as `csysdig -v containers`{{interrupt execute}}
