# Main link

gcloud cheatsheet is here: https://cloud.google.com/sdk/docs/cheatsheet

## setup other apps

    gcloud auth configure-docker              # makes docker work
    gcloud container clusters get-credentials # Update kubeconfig to get kubectl to use a GKE cluster.

## config

    gcloud config list --format 'value(core.account)' # returns current user
    gcloud config list --format 'value(core.project)' # returns current project_id

## Cool examples

Some examples if you're too lazy to click:



For a list of projects created on or after 15 January 2018, sorted from oldest to newest, presented as a table with project number, project id and creation time columns with dates and times in local timezone:

    gcloud projects list --format="table(projectNumber,projectId,createTime.date(tz=LOCAL))" \
        --filter="createTime>=2018-01-15T12:00:00" --sort-by=createTime
