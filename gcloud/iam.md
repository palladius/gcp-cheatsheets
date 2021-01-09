gcloud group add-iam-policy-binding resource \
    --member=member --role=role-id

You can grant gcloud permission to either a PROJECT or an ORG.

For project:

    gcloud projects add-iam-policy-binding my-project \
    --member=user:my-user@example.com --role=roles/viewer # grants permission to a user

Real use case scenario: grant your GKE cluster access to GCR in another project:

    # This code is useful to grant to your current project PROJECT_NUMBER to access
    # GCR repos. NOte GKE uses the dflt GCE service account installed in each GCE node
    # of GKE cluster.
    export GCE_SVC_ACCOUNT="$GKE_PROJECT_NUMBER-compute@developer.gserviceaccount.com"
    gcloud projects add-iam-policy-binding $GCR_PROJECT_ID \
    --member=serviceAccount:"$GCE_SVC_ACCOUNT" --role=roles/storage.objectViewer



## Docs

* https://cloud.google.com/iam/docs/granting-changing-revoking-access