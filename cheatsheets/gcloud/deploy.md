I've written a long and quite complex example on how to use Cloud Deploy on steroids.

For instance, you can check my code for (😃 WOW 😃):

* [Show latest successful releases](https://github.com/palladius/clouddeploy-platinum-path/blob/main/09-show-latest-successful-releases.sh)
* [Auto-promote an app from one stage to another](https://github.com/palladius/clouddeploy-platinum-path/blob/main/10-auto-promote-APP_XX-STAGE_YY-to-STAGE_ZZ.sh)

## DeliveryPipelines

Show Pipelines (one of the few which doesnt need a region to execute):

    gcloud deploy delivery-pipelines list

## Promote from 1 target (eg DEV) to another target (eg PROD)

See https://github.com/palladius/clouddeploy-platinum-path/blob/main/10-auto-promote-APP_XX-STAGE_YY-to-STAGE_ZZ.sh

First you need to find the last successsful release ([code](https://github.com/palladius/clouddeploy-platinum-path/blob/main/09-show-latest-successful-releases.sh)):

```bash
    LATEST_SUCCESSFUL_RELEASE=$(
        gcloud deploy releases list --delivery-pipeline "$PIPELINE" \
        --filter renderState='SUCCEEDED' \
        --format="value(name.split())" \
        --sort-by=~createTime --limit 100 |
        cut -d';' -f 8 |
        head -1
    )
```

then you can proceed with the promotion ([code](https://github.com/palladius/clouddeploy-platinum-path/blob/main/10-auto-promote-APP_XX-STAGE_YY-to-STAGE_ZZ.sh)):

```bash
gcloud deploy releases promote --to-target "$DESIRED_STAGE" --region "$CLOUD_DEPLOY_REGION" \
    --release "$LATEST_SUCCESSFUL_RELEASE" --delivery-pipeline="$PIPELINE" --quiet
```
