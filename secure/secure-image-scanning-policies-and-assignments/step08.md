Click on the failing image and you’ll be taken to the results page.

![Failing image](/sysdig-devel/courses/scvs/lab06/assets/19_failing.png)

From here you can see that this image is being evaluated against the NIST 800-190 policy rather than the default policy, and we can see the ‘Stop’ actions being highlighted as failing the image scan. A contextual link is provided to the various vulnerabilities that have been detected. You can explore the results of the image scan, what the policy is evaluating against, details against the vulnerabilities and even the contents of the image.

![Results](/sysdig-devel/courses/scvs/lab06/assets/20_results.png)

If a new vulnerability is released, or if you change the policy assignment, the image doesn’t need to be scanned again as the contents are stored in the image scanning database. This makes updating against policy changes or new vulnerabilities incredibly fast and efficient.
