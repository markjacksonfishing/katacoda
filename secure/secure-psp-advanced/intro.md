This course covers how to manually enable Pod Security Policies (PSPs from here on out) in your cluster. Although anyone willing to learn can take this course, we recommend some K8s previous experience and a base knowledge about PSPs. To cover this, we have prepared [two basic PSP scenarios](link to courses) you can take before taking this one. The goal of this course is to provide a deep dive on every step required to enable PSPs in your cluster, so you can understand what is happening under the hood.

# Table of contents

Introduction

K8s PSPs vs. Sysdig PSP Advisor
Pre-requirements (I): Enabling Auditing
Pre-requirements (II): Install the agent
Pre-requirements (III): PSPs enablement
Defining a default restrictive PSP
Defining a permissive PSP for system-wide services
Create a temporary permissive PSP for our app
PSP generation from deployment app
Deploy application
Replace with new PSP
Last step:alternatives to this workflow
Finish: last comments

# Requirements
Here, we are providing everything you need to play and learn more about PSPs from your web browser: a K8s cluster and a tab with access to Sysdig Secure. You just need a Sysdig account. If you don’t have an account you can have a working one [here](https://sysdig.com/training-trial-signup/) in less than 5 minutes.
