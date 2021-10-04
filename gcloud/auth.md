
I always get confused here :)
So here you go:






## Authenticating on behalf of your apps

This is needed when you want to use Python, Node, .. APIs and you can't / don't
want to use a service account.

  gcloud auth application-default login

Once I got a mysterious error which asked me to RE-authorize:

  gcloud auth login --update-adc

Explaination here:

Credentials saved to file: [~/.config/gcloud/application_default_credentials.json]

These credentials will be used by any library that requests Application Default Credentials (ADC).

Quota project "<project_id>" was added to ADC which can be used by Google client libraries for billing and quota. Note that some services may still bill the project owning the resource.
Sometimes you need to run: gcloud auth login --update-adc

## docker

Authenticate as docker/GKE:

  gcloud auth configure-docker
