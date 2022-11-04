

#export
# persists to the current kube context.
# if you change between STAG and PROD it it picks up correctly.

#1. find right GKE cluster to deploy to PROD in Goldie
gcloud container clusters get-credentials prod --region us-central1 --project ror-goldie

# 2. configure for Riccardo
skaffold config set default-repo europe-west1-docker.pkg.dev/ror-goldie/gcp-cheatsheets-hugo

# cat ~/.skaffold/config to see it.
# you can also tell skaffold depending on profile what to choose -> ok for 201 lesson from Alex :)
