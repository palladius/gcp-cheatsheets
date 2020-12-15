
Deploy a sample function with data in local folder:

	gcloud functions deploy helloWorld \
	  --stage-bucket $BUCKET_NAME \
	  --trigger-topic hello_world \
	  --runtime nodejs8

Basic ops:

	gcloud functions logs read helloWorld  # read logs
	gcloud functions describe helloWorld   # describe artifact

call HTTP endpoint:

	DATA=$(printf "$MESSAGE" |base64) # should make it easy to avoid quote issues.
	gcloud functions call helloWorld --data '{"data":"'$DATA'"}'

## Minimal helloworld App

### Node.js

	# index.js
	exports.helloWorld = (data, context) => {
		const pubSubMessage = data;
		const name = pubSubMessage.data
		    ? Buffer.from(pubSubMessage.data, 'base64').toString() : "Hello World";
		console.log(`My minimal Cloud Function: ${name}`);
	};