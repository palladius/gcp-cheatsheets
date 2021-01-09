This is about GCE and Compute APIs. focusing on gcloud and command line in general.

Compute is a BIG world, it encompasses many topics and we might have to break this down sooner or later as the file grows :)

For now, enjoy these topics by alpha order:

* networks
* FW ruels
* VMs



## Networks

List:

    gcloud compute networks subnets list --sort-by=NETWORK # Lists all your networks

Creation. Custom networks have no subnets so you need to add them yourself:

	gcloud compute networks create privatenet --subnet-mode=custom
	gcloud compute networks subnets create privatesubnet-us --network=privatenet --region=us-central1 --range=172.16.0.0/24
	gcloud compute networks subnets create privatesubnet-eu --network=privatenet --region=europe-west1 --range=172.20.0.0/20

Note that IP space is not checked upon creation - you can artificially collisions. In Google we'd say it's a feature, not a bug :)



## Firewall Rules

Create a FW rule which enables SSH+RDP+ICMP in a certain network

	gcloud compute firewall-rules create managementnet-allow-icmp-ssh-rdp \
	  --description="Allow basic\ stuff, plus RDP because Im suicidal :)" \
	  --direction=INGRESS --priority=1042 --network=privatenet --action=ALLOW \
	  --rules=tcp:22,tcp:3389,icmp --source-ranges=0.0.0.0/0

Show FW Rules sorting by network:

	gcloud compute firewall-rules list --sort-by=NETWORK



## Virtual Machines

### Creation

Create a machine with loads of default values:

    gcloud compute instances create my-us-machine --zone=us-central1-c --machine-type=n1-standard-1 --labels=env=test

Create a VM inside a specific network/subnetwork (note the service account):

	gcloud beta compute instances create managementnet-us-vm \
	--description="i love this machine and heres why I created it.." \
	--zone=us-central1-c --machine-type=f1-micro \
	--subnet=managementsubnet-us --network-tier=PREMIUM \
	--maintenance-policy=MIGRATE \
	--scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append \
	--tags=ricc-tag --reservation-affinity=any \
	--image=debian-10-buster-v20201112 --image-project=debian-cloud \
	--boot-disk-size=10GB --boot-disk-type=pd-standard \
	--boot-disk-device-name=managementnet-us-vm \
	--no-shielded-secure-boot --shielded-vtpm --shielded-integrity-monitoring \
	--labels=env=test,peerbonus=ricc 
	# For additional powers and decreased security, Consider adding the Dflt GCE SvcAccount: 
	# 1. export PROJECT_NUMBER=123456789
	# 2. Add this to command above: --service-account=${PROJECT_NUMBER}-compute@developer.gserviceaccount.com 

Note many of these values are NOT needed, but it's good in case you want to edit some of those. I particularly dislike the image artifact since you ened to specify two things: name of image and project where it comes from.

Create a VM in THREE networks (need 3 CPU, hence probably a n1-standard4  for it):

### List

For Compute Engine instances with prefix us and not machine type f1-micro:

    gcloud compute instances list --filter="zone ~ ^us AND -machineType:f1-micro"

For a list of ten Compute Engine instances with a label my-label (of any value):

    gcloud compute instances list --filter="labels.my-label:*" --limit=10

Shows your project VMs:

    gcloud compute instances list --sort-by=ZONE    # shows list by zone
	gcloud compute instances list --sort-by=NETWORK # shows list by network (but you dont see the network!)

## SSH

SSH-ing is a weird, myserious yet super-secure process. You can ssh via KEY or IAM (forget password!):

   gcloud compute ssh --zone MYZONE VMNAME 

If you like to leverage config, you canr un this awesome command (docs: https://cloud.google.com/sdk/gcloud/reference/compute/config-ssh):

    gcloud compute config-ssh                        # @oneoff

## Quotas

To check your quotas, see this doc: https://cloud.google.com/compute/quotas



# Documentation

* Quotas: https://cloud.google.com/compute/quotas