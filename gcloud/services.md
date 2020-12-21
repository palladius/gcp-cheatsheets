
Enable services / APIs :

    gcloud services enable cloudscheduler.googleapis.com   # Enable Cloud Scheudler APIs
	gcloud services enable cloudasset.googleapis.com.      # Enable Cloud Assets APIs
	gcloud services enable \ 							
		cloudshell.googleapis.com \
		cloudbuild.googleapis.com \
		containerregistry.googleapis.com \
		container.googleapis.com \
		cloudtrace.googleapis.com 						   # Enable multiple APIs

Create Service Account

	gcloud beta services identity create --service=cloudasset.googleapis.com # --project=PROJECT_ID