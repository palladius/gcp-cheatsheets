
I always get confused here. So here you go:

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
Sometimes you need to run: `gcloud auth login --update-adc`

Some tips on ADC:

* The ADC credentials are a well kept secret: find them here
  `cat ~/.config/gcloud/application_default_credentials.json`.
* ADC doesn't play well with `$ gcloud config configurations XXX`. So if you
  switch the configuration from A to B, your ADC will stay the same. 😥

## docker

Authenticate as docker/GKE:

  gcloud auth configure-docker

## Auth token by smell

Wanna recognize a token by regexing it? "Oh yes, that smells like a refresh token!"

Thanks to Roberto, now you can:

* `4/xxxxxxxxxx` This is an Auth Token.
* `1//xxxxxxxxx` This is a refresh token. Some have a simple slash `1/`.
* `ya29.<XXXX>` This is a Refresh Access Token.

Example from https://developers.google.com/android-publisher/authorization: 

```{
  "access_token" : "ya29.???",
  "token_type" : "Bearer",
  "expires_in" : 3600,
  "refresh_token" : "1/za???"
}```

Thanks to Roberto and Salman to document this.

```$ gcloud auth print-access-token 
ya29.<Im not gonna tell you>
$ gcloud auth print-identity-token 
xxxxxxxxxxxxxxxxxxxxxxxx # 841 alphanums with some - and _
```