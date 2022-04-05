## gcloud config ...

For `gcloud config`, defer to `gcloud.md` file in this directory.

    gcloud config set core/project MY_PROJECT    # sets project id to default project. You can do the same with zone, ..

Other options:

* `core/log_http` so you see whcih API is called
* `compute/zone` and `compute/region` for automated resource allocation when using gcloud compute (very useful!)

* get stuff:

    # Note: for "core/SOMETHING", also "SOMETHING" alone seems to work
    $ gcloud config get-value core/project # or 'project'
    my-project
    $ gcloud config get-value core/account
    myaccount@gmail.com
    $ gcloud config get-value core/region
    $ gcloud config get-value core/zone

* Set stuff:

    gcloud config set core/project MY_PROJECT    # sets project id to default project. You can do the same with zone, ..

