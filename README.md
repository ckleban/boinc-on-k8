boinc-on-k8
===========

### What:   
Donate extra cpu cycles to charity with Kubernetes, Docker and boinc.

### tldr:
```
kubectl create -f boince-rc.yml 
kubectl scale rc boinc-workers --replicas=3
```

### Background:

Boinc is a program that is used to donate cpu cycles for charitable purposes. Boinc is put into a Docker container, we deploy X copies of these containers to a Kubernetes cluster using Kubernetes' replication controller construct. The key files are the docker container that wraps up boinc and the bonic-rc.yml file that deploys some number of workers to a kubernetes cluster. This example uses the world community grid to organize various boinc projects. If you want to pick another group or specific projects, feel free to edit the files below to do so. 


### How to use this:

```
1. Make sure you have a kubernetes cluster somewhere
2. create an account at www.worldcommunitygrid.org and grab the and create yourself an acocunt. 
3. Grab the 'account key' from the settings/my profile UI path and insert your key in the boinc-rc.yml file
4. Spin up a single  boinc worker in your k8 clusters by running:
kubectl create -f boince-rc.yml
5. Change the number of boinc workers to some specific number (in this case, 3 workers)
kubectl scale rc boinc-workers --replicas=3
 
```

### How to stop the boinc workers:
 
`kubectl stop -f boinc-rc.yml `


### what next?

I'd like to build on this to test kubernetes's current resource quota features and to be released priority features. In the end, it would be nice if kubernetes users could set a replication controller up that simply used up only the 'spare' resources that a cluster had and didn't impact the business functions occuring in the cluster (similar to other types of batch jobs that businesses need to run). 


### Notes:

I forked ozzyjohnson's work to get boinc running in docker and added some kubernetes files on top of his work. If you want to use boinc straight in docker, go see ozzyjohnson/docker-boinc


