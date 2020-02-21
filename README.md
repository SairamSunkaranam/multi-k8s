# This project is intendend to automate the application deploy on kubernetes

# To deploy the application :

Create TravisCI account 

Attach your GIT Hub repo with Travis CI

Create GKE cluster on Google cloud

Make sure you are changing cluster related and docker hub information on .travis.yml in home directory 

You need to create ingress-nginx service on GKE cluster using helm

The last step is to create secret for postgres DB -> POSTGRES_PASSWORD

After all tasks completed, make sure your Travis CI Build completed successfully and all configurations created on GKE cluster.
