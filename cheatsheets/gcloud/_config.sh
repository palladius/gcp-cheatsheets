This is a collection of generic configurations client-side.
Something you call client side and changes the bahaviour of your clients (gcloud, kubectl , ..)

# ssh

    gcloud compute config-ssh     # sets up ~/.ssh/config to automatically ssh into machines without passing from gcloud. Amazing

# kubectl

    gcloud container clusters get-credentials my-cluster --zone europe-west1-d --project my-project # sets `kubectl` to connect to your cluster.

## gcloud

<<<<<<< HEAD:cheatsheets/gcloud/_config.sh
    gcloud config set core/project MY_PROJECT    # sets project id to default project. You can do the same with zone, ..

## Auth

See auth.md for more info. However for completeness I'll enumerate those commands here too:

    gcloud auth application-default login
    gcloud auth login --update-adc
    gcloud auth configure-docker

Other options: 

* `core/log_http` so you see which API is called, 
* `compute/zone` and `compute/region` for automated resource allocation when using gcloud compute (very useful!)
=======
For `gcloud config`, defer to `gcloud.md` file in this directory.
>>>>>>> 5289490 (adding a config specific file for gcloud):gcloud/_config.sh

