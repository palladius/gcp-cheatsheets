This is an amazing API to query multiple projects at once and get all entities.
It support a project/folder/org as a target (but not an array of those).

Search:

	gcloud asset search-all-resources | egrep ^name:                    # get EVERYTHING and just select resource name.
    gcloud asset search-all-resources --query labels.env:prod           # Finds all resources of label ENV=PROD
    gcloud asset search-all-resources --scope organizations/$ORG_ID     # Finds all resources in Org $ORG_ID
    gcloud asset search-all-resources --query test |egrep ^name:        # All resources which contain "test" in any searchable field (short version)

Smarter search:

    # Finds all GCS buckets with name matching palladius
    gcloud asset search-all-resources --query palladius --asset-types storage.googleapis.com/Bucket | grep 'displayName:'


IAM Policy search:

    gcloud asset analyze-iam-policy --organization=$ORG_ID \
       --permissions='iam.serviceAccounts.actAs'
    gcloud asset analyze-iam-policy --organization=$ORG_ID \   # All To find out which resources a user can access
       --identity='user:ricc@google.com'                   

Export to BigQuery and have fun querying it:
	
	# Create Dataset under current core/project (it fails if you call with --project as it confuses for Asset scope! #facepalm )
	# current_project:assets2020 must exist; mytest table will be created/overwritten.
	gcloud beta asset export --organization=911748599584 --bigquery-dataset assets2020 --bigquery-table=mytest --output-bigquery-force  
	
	# Same but creates A LOT of different tables
    gcloud beta asset export --organization=911748599584 --bigquery-dataset assets2020 --bigquery-table=separato --per-asset-type --output-bigsquery-force 
	
	# Useful query to see GCE VMs which are probably NOT GKE (better to use tag than name regex but still...)
	echo ' SELECT * FROM `ric-cccwiki.assets2020.prova` 
	        WHERE asset_type like "compute.googleapis.com/Instance"
	          AND name not like "%instances/gke%" '  |  bq query --use_legacy_sql=false 
	 
	
Operations Listing:

	# Once you launch an op, it says in output something like this:
	Use [gcloud asset operations describe organizations/911748599584/operations/ExportAssets/CONTENT_TYPE_UNSPECIFIED/71a7453c661c30f8874414ba337c1328]
	to check the status of the operation.
	
	gcloud asset operations describe organizations/911748599584/operations/ExportAssets/CONTENT_TYPE_UNSPECIFIED/71a7453c661c30f8874414ba337c1328
 	
Unfortunately there's no `gcloud asset operations list` (yet?).

## Notes

    --project and its fallback core/project property play two roles in
          the invocation. It specifies the project of the resource to operate
          on. It also specifies the project for API enablement check, quota,
          and billing. To specify a different project for quota and billing,
          use --billing-project or billing/quota_project property.

This means that the calling project might be different from the "called" project(s).

## Resources

* https://cloud.google.com/sdk/gcloud/reference/asset/search-all-resources