This course covers how to manually enable Pod Security Policies (PSPs from here on out) in your cluster. Although anyone willing to learn can take this course, we recommend some K8s previous experience and a base knowledge about PSPs. To cover this, we have prepared [two basic PSP scenarios](link to courses) you can take before taking this one. The goal of this course is to provide a deep dive on every step required to enable PSPs in your cluster, so you can understand what is happening under the hood.

# Table of contents

Intro.md - Introduction
Step01.md - K8s PSPs vs. Sysdig PSP Advisor
Step02.md Pre-requirements (I): Enabling Auditing
Step03.md - Pre-requirements (II): Install the agent
Step04.md -Pre-requirements (III): PSPs enablement
Step05.md - Defining a default restrictive PSP
Step06.md Defining a permissive PSP for system-wide services
Step07.md - Create a temporary permissive PSP for our app
Step08.md - PSP generation from deployment app
Step09.md - Deploy application
Step10.md - Replace
Step11.md - Last step:comment about two clusters Bencer
Step12.md - Finish

# Requirements
Here, we are providing everything you need to play and learn more about PSPs from your web browser: a K8s cluster and a tab with access to Sysdig Secure. You just need a Sysdig account. If you don’t have an account you can have a working one [here](https://sysdig.com/training-trial-signup/) in less than 5 minutes.
