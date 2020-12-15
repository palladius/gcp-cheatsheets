This is about GCE and Compute APIs. focusing on gcloud and command line in general.





## Networks

List:

    gcloud compute networks subnets list --sort-by=NETWORK # Lists all your networks

Creation. Custom networks have no subnets so you need to add them yourself:

	gcloud compute networks create privatenet --subnet-mode=custom
	gcloud compute networks subnets create privatesubnet-us --network=privatenet --region=us-central1 --range=172.16.0.0/24
	gcloud compute networks subnets create privatesubnet-eu --network=privatenet --region=europe-west1 --range=172.20.0.0/20

Note that IP space is not checked upon creation - you can artificially collisions. In Google we'd say it's a feature, not a bug :)