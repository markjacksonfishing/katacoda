The pipelines will not work, unless you provide your DockerHub credentials and the image name that the pipeline will build and scan.

Let's begin with the credentials creation. Click on **Credentials** to create a new one.

![Credentials menu item](assets/image08.png)

Now, click on the **(global)** link to show all the credentials in the global scope (which should be empty).

![Credentials page](assets/image09.png)

You can create the credentials using the **Add Credentials** button.

![Add Credentials button](assets/image10.png)

Docker Credentials
------------------

In Kind select "Username with password", and insert your data.
The key part here is that you _must_ write **"docker-repository-credentials"** in the **ID field**.

![Docker Credentials](assets/image11.png)