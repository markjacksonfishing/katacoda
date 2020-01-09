The basic set up for image registry scanning is:
 1. provide registry information where your images are stored,
 1. trigger a scan, and
 1. review the results.

Behind the scenes:
 1. Image contents are analyzed.
 1. The contents report is evaluated against multiple vulnerability databases.
 1. It is then compared against default or user-defined policies.
 1. Results are reported, both in Sysdig Secure and (if applicable) in a developer's external CI tool.

The important thing to note is that the scan is invoked by the Sysdig backend system, and involved the backend downloading the container from the registry.

# Inline Image Scanning

You also have the option to scan and analyze images locally, sending their infrastructure metadata back to the Sysdig platform without providing access to their registry. The feature may be desired in a variety of cases:
 - Images don't leave their own environment
 - SaaS users don't send images and proprietary code to Sysdig's SaaS service
 - Registries don't have to be exposed
 - Images can be scanned in parallel more easily
 - Images can be scanned before they hit the registry, which can
    - cut down on registry costs
    - simplify the build pipeline

We shall explore the various aspects of Image Scanning by way of some hands-on exercises.  But first we must set up our lab environment.
