
**Programmatically associate a billing account to a project** (cool! 😎):

    # If you have the BAID:
    gcloud beta billing projects link "my-project-id" --billing-account "012345-ABCDEF-678901"

If you don't know the BAID by heart, to **list all BAIDs**:

    🐼 gcloud beta billing accounts list
    ACCOUNT_ID            NAME                                                       OPEN   MASTER_ACCOUNT_ID
    0006EA-ABCDEF-23BCBF  Billing Account for Blah blah blash                        False
    000E23-ABCDEF-165177  Billing Account for Foo Bar Baz                            True
    [..]

List projects associated to a certain BAID (note you cant list them all unless you enumerate all BAIDs):

    # note that thjis is mandatory also for alpha and beta version :(
    $ gcloud beta billing projects list --billing-account 002E2F-ABCDEF-163D05

If you want to cheat you can call this expensive Behemoth :

```bash
# Iterate through all your BAIDs to enumerate ALL your projects/BAID enumerations:
gcloud beta billing accounts list --format 'csv[no-heading](name)' | while read BAID ; do
    echo "-- 😎 Swicthing to BAID: $BAID --" >&2
    # third seems useless! Skipping 'name'
    gcloud beta billing projects list --billing-account "$BAID"  --format 'csv[no-heading](billingAccountName,billingEnabled,projectId)'
done  | tee tmp.projects-and-BAIDs.behemoth.txt
```

Aneddotically I have 16k projects which is why PMs decided probably to forbid this:

```bash
$ wc -l tmp.projects-and-BAIDs.behemoth.txt
16660 tmp.projects-and-BAIDs.behemoth.txt
```

## Docs

* https://cloud.google.com/billing/docs/how-to/modify-project
