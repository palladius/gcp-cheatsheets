# GCS and GSutils

Creation:

    gsutil mb -c regional -l us-central1 gs://mybucket
	
Grant READ to everyone to bucket / file:

	gsutil acl ch -u allUsers:R gs://mybucket
	gsutil acl ch -u allUsers:R gs://mybucket/testfile.txt

Simulate traffic:

	ab -n 10000 http://storage.googleapis.com/mybucket/testfile.txt

Great tutorial to do so: https://run.qwiklabs.com/focuses/7829 "Optimizing Cost with Google Cloud Storage"