
Deploy a sample function with data in local folder:

	gcloud functions deploy helloWorld \
	  --stage-bucket $BUCKET_NAME \
	  --trigger-topic hello_world \
	  --runtime nodejs8

Read logs:

	gcloud functions logs read helloWorld

describe:

	gcloud functions describe helloWorld

test:
	./test-gcf.sh Ciao da Makefile
	
	DATA=$(printf "$MESSAGE" |base64) # with printf i have no training /n
	gcloud functions call helloWorld --data '{"data":"'$DATA'"}'








## Minimal helloworld App

	# index.js
	exports.helloWorld = (data, context) => {
		const pubSubMessage = data;
		const name = pubSubMessage.data
		    ? Buffer.from(pubSubMessage.data, 'base64').toString() : "Hello World";

		console.log(`My minimal Cloud Function: ${name}`);
	};