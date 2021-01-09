This is a collection of generic configurations client-side.
Something you call client side and changes the bahaviour of your clients (gcloud, kubectl , ..)

# ssh

    gcloud compute config-ssh     # sets up ~/.ssh/config to automatically ssh into machines without passing from gcloud. Amazing

# kubectl

    gcloud container clusters get-credentials my-cluster --zone europe-west1-d --project my-project # sets `kubectl` to connect to your cluster.

## gcloud 

    gcloud config set core/project MY_PROJECT    # sets project id to default project. You can do the same with zone, ..

Other options: 

* `core/log_http` so you see whcih API is called, 
* `compute/zone` and `compute/region` for automated resource allocation when using gcloud compute (very useful!)

