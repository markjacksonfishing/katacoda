In this scenario we will deploy Jenkins, we will set up the required configuration for the Sysdig Secure plugin integration, and we will execute some image build and scan in a pipeline, that will fail due to some errors in the image built, and some vulnerabilities found.

We will see the full report in Sysdig Secure as well, and we will create an alert to inform us that the image scan has failed.

Goals
-----

- Explore how we integrate Jenkins with Sysdig Secure through a plugin.
  - How to configure Jenkins for the plugin usage.
  - How to execute the pipeline.
  - See the full report in Jenkins and Sysdig Secure.
- Be able to find out vulnerabilities in our images, and incorrect image creations.
  - Spot operating system vulnerabilities
  - Spot application library vulnerabilities
  - Spot unwanted exposed ports, or packages that should not be installed.
  