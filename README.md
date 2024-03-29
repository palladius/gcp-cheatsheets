# GCP Cheatsheets

Self: `palladius/gcp-cheatsheets` (so i can google it :P)

This repo contains a number of useful GCP useful commands,
ranging from `gcloud` to its siblings (gsutil, kubectl, ..).

Anything GCP related pertains here. Feel free to drop me a PR to add stuff. And rather than copying from other resources, better to link them.

TODO(ricc): dockerize this to render MD into HTML and have SUPER fast cross link with left/upper navigation. Doing it right now.

## Hugo

This website has also a self-service Hugo website which autoupdates when I change some files :)

* Published to: https://gcp-cheatsheets.netlify.app/

## Naming Conventions

* Filename should follow the name of the command line you're going to use (`kubectl`, `docker` , ...).
* Most commands revolve around gcloud. There's a directory for you. Every gcloud subcommands (say gcloud compute) is under
  the gcloud directory with the name of the second worg (eg, compute.md).
* Avoid Pleonasms (Google, Cloud, GCP).

## Additional resources

These are much better than mine - come back when you've fagocitated them:

* GCP awesome cheat-sheet in colorful PDF format: https://cloud.google.com/sdk/docs/images/gcloud-cheat-sheet.pdf
* `kubectl` cheasheet: https://kubernetes.io/docs/reference/kubectl/cheatsheet/ (which actually inspired me for this repo)
* `gcloud` cheatsheet: https://cloud.google.com/sdk/docs/cheatsheet
* Google Cloud colorful keywords: https://github.com/gregsramblings/google-cloud-4-words (from awesome Priyanka)

## Thanks

Thanks to a number of people who contributed to the Lore hereby contained.

* `[salrashid123](https://github.com/salrashid123)` and `[drebes](https://github.com/drebes)` for [ADC and Auth](https://github.com/salrashid123/gcloud_alias_adc).