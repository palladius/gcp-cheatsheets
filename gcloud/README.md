# Main link

gcloud cheatsheet is here: https://cloud.google.com/sdk/docs/cheatsheet

## setup other apps

    gcloud auth configure-docker              # makes docker work
    gcloud container clusters get-credentials # Update kubeconfig to get kubectl to use a GKE cluster.

## config

    gcloud config list --format 'value(core.account)' # returns current user
    gcloud config list --format 'value(core.project)' # returns current project_id

