# Synopsis

APIs for your GCR `docker` repos. 
**Not** to be confused with gcloud source repos which are your GIT repos.

Note this is getting obsoleted in favor of `artifact registry`. give it some time..

## Listing repos and versions

    # Shows all repos in CURRENT project_id
    gcloud container images  list

    # Shows all repos in ANOTHER project_id
    gcloud container images  list --repository gcr.io/another-project-id

    # Shows all version for one repo (note absence of --repo since its a precise argument of LIST-TAGS)
    gcloud container images list-tags gcr.io/goliardia-prod/goliardia-it
 