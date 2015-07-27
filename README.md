boinc-on-k8
===========

These files allow someone to run Boinc on a kubernetes cluster. Boinc is a program that is used to donate cpu cycles for charitable purposes. 

The key files are the docker container that wraps up boinc and the bonic-rc.yml file that deploys some number of workers to a kubernetes cluster. 



Usage examples:
============


### Start up 1 worker on your kubernetes cluster 
kubectl create -f boince-rc.yml

### Change the number of boinc workers to some value (in this case, 3 workers)
kubectl scale rc boinc-workers --replicas=3

### Stop all boinc workers
kubectl stop -f boinc-rc.yml 
# or.. 
kubectl stop rc boinc-workers




-----------



Notes:

I forked ozzyjohnson's work to get boinc running in docker and added some kubernetes files on top of his work. If you want to use boinc straight in docker, go see ozzyjohnson/docker-boinc

