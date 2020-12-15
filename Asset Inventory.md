I knew I'd get your attention ;) 

Search:

	gcloud asset search-all-resources |egrep ^name:               $ get EVERYTHING and just select resource name.
    gcloud asset search-all-resources --query labels.env:prod             # Finds all resources of label ENV=PROD
    gcloud asset search-all-resources --scope organizations/$ORG_ID        # Finds all resources in Org $ORG_ID
    gcloud asset search-all-resources --query test |egrep ^name:          # All resources which contain "test" in any searchable field (short version)

IAM Policy search:

    gcloud asset analyze-iam-policy --organization=$ORG_ID \
       --permissions='iam.serviceAccounts.actAs'
    gcloud asset analyze-iam-policy --organization=$ORG_ID \   # All To find out which resources a user can access
       --identity='user:ricc@google.com'                   



## Resources

* https://cloud.google.com/sdk/gcloud/reference/asset/search-all-resources