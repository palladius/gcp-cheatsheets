<!-- trying to solve this :) https://github.com/palladius/sakura/issues/7 -->

* Get all the ARs of type docker:

    gcloud artifacts repositories list --filter format='DOCKER'

## A real case scenario

I struggled a bit, then I had a stroke of luck: I made a mistake which gcloud didn't like.

```bash
$ gcloud artifacts repositories list --format 'table(.blah)'
Listing items under project cicd-platinum-test032, across all locations.

ERROR: (gcloud.artifacts.repositories.list) Non-empty key name expected [    table[title="ARTIFACT_REGISTRY"](
         name.basename():label=REPOSITORY,
         format:label=FORMAT,
         mode.basename(undefined=STANDARD_REPOSITORY):label=MODE,
         description:label=DESCRIPTION,
         name.segment(3):label=LOCATION,
         labels.list():label=LABELS,
         kmsKeyName.yesno(yes='Customer-managed key', no='Google-managed key'):label=ENCRYPTION,
         createTime.date(tz=LOCAL),
         updateTime.date(tz=LOCAL),
         sizeBytes.size(zero='0',precision=3,units_out=M):label="SIZE (MB)"
    ) table( *HERE* .blah)].
```

I couldnt find the Region, Location, or anything until I reverse engineered what Engineers did:

* Region: `name.segment(3)`
* name: `name.basename()`

.. so let's try now.


## links

* https://cloud.google.com/sdk/gcloud/reference/artifacts/repositories/list

🌻 Note this docs solve [this issue](https://github.com/palladius/sakura/issues/7).
