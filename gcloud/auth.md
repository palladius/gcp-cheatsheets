
I always get confused here :)
So here you go:






## Authenticating on behalf of your apps

This is needed when you want to use Python, Node, .. APIs and you can't / don't
want to use a service account.

  gcloud auth application-default login

Once I got a mysterious error which asked me to RE-authorize:

  gcloud auth login --update-adc
