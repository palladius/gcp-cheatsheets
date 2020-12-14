# Main link

gcloud cheatsheet is here: https://cloud.google.com/sdk/docs/cheatsheet

## setup other apps

    gcloud auth configure-docker              # makes docker work
    gcloud container clusters get-credentials # Update kubeconfig to get kubectl to use a GKE cluster.

## Cool examples
Some examples if you're too lazy to click:

For Compute Engine instances with prefix us and not machine type f1-micro:

    gcloud compute instances list --filter="zone ~ ^us AND -machineType:f1-micro"

For a list of projects created on or after 15 January 2018, sorted from oldest to newest, presented as a table with project number, project id and creation time columns with dates and times in local timezone:

    gcloud projects list --format="table(projectNumber,projectId,createTime.date(tz=LOCAL))" \
        --filter="createTime>=2018-01-15T12:00:00" --sort-by=createTime

For a list of ten Compute Engine instances with a label my-label (of any value):

    gcloud compute instances list --filter="labels.my-label:*" --limit=10
