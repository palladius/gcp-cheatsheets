For explicit `gcloud config ...` invocations, defer to `gcloud/config.md` file
in this directory.

This is a meta-page for every other configuration you want to do like SSH,
Docker, ... This is a collection of generic configurations client-side.
Something you call client side and changes the bahaviour of your clients
(gcloud, kubectl , ..)

# ssh

    gcloud compute config-ssh     # sets up ~/.ssh/config to automatically ssh into machines without passing from gcloud. Amazing

# kubectl

    gcloud container clusters get-credentials my-cluster --zone europe-west1-d --project my-project # sets `kubectl` to connect to your cluster.

## gcloud

As I said, check `gcloud/config.md`.

## Auth

See auth.md for more info. However for completeness I'll enumerate those commands here too:

    gcloud auth application-default login
    gcloud auth login --update-adc
    gcloud auth configure-docker

Other options:

* `core/log_http` so you see which API is called,
* `compute/zone` and `compute/region` for automated resource allocation when using gcloud compute (very useful!)


