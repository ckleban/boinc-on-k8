boinc-on-k8
===========

### What: 
Donate extra cpu cycles to charity with Kubernetes, Docker and boinc.

### tldr: 
kubectl create -f boince-rc.yml 
kubectl scale rc boinc-workers --replicas=3

### Background:

Boinc is a program that is used to donate cpu cycles for charitable purposes. Boinc is put into a Docker container, we deploy X copies of these containers to a Kubernetes cluster using Kubernetes' replication controller construct. The key files are the docker container that wraps up boinc and the bonic-rc.yml file that deploys some number of workers to a kubernetes cluster. 


 ### How to use this:

 1. Make sure you have a kubernetes cluster somewhere
 2. create an account at www.worldcommunitygrid.org and grab the and create yourself an acocunt. 
 3. Grab the 'account key' from the settings/my profile UI path and insert your key in the boinc-rc.yml file
 4. Spin up a single  boinc worker in your k8 clusters by running:
 `-- > kubectl create -f boince-rc.yml `
 5. Change the number of boinc workers to some specific number (in this case, 3 workers)
 `-- > kubectl scale rc boinc-workers --replicas=3`
 
### How to stop the boinc workers:

 1. run this command:
 `-- > kubectl stop -f boinc-rc.yml `




### Notes:

I forked ozzyjohnson's work to get boinc running in docker and added some kubernetes files on top of his work. If you want to use boinc straight in docker, go see ozzyjohnson/docker-boinc

