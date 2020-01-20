This course covers how to manually enable Pod Security Policies (PSPs from here on out) in your cluster. Although anyone willing to learn can take this course, we recommend some K8s previous experience and a base knowledge about PSPs. To cover this, we have prepared [two basic PSP scenarios](https://academy.sysdig.com/series/sysdig-secure) you can take before taking this one. The goal of this course is to provide a deep dive on every step required to enable PSPs in your cluster, so you can understand what is happening under the hood.

# Table of contents

Introduction<br/>
K8s PSPs vs. Sysdig PSP Advisor<br/>
Pre-requirements (I): Enabling Auditing<br/>
Pre-requirements (II): Install the agent<br/>
Pre-requirements (III): PSPs enablement<br/>
Defining a default restrictive PSP<br/>
Defining a permissive PSP for system-wide services<br/>
Create a temporary permissive PSP for our app<br/>
PSP generation from deployment app<br/>
Deploy application<br/>
Replace with new PSP<br/>
Last step:alternatives to this workflow<br/>
Finish: last comments<br/>

# Requirements
Here, we are providing everything you need to play and learn more about PSPs from your web browser: a K8s cluster and a tab with access to Sysdig Secure. You just need a Sysdig account. If you don’t have an account you can have a working one [here](https://sysdig.com/company/free-trial/) in less than 5 minutes.
