<!-- note to self, this anbout FILTERs amnd FORMATS so naming is incorrect.

Two solutions:
* when this is bigger, refactor in two sub sections
* rename to something which reflects both (eg, gcloud pseudo-SQL)

-->
This is a meta-module to help you filtering your gcloud.

This page attempts to answer the question: how do I do a SQL-like query to a list of GCP entities?

```sql
    SELECT field1, field2, ..   # formats
      FROM ArtifactRepositories
     WHERE type = 'DOCKER'      # filters
```

=>

    # See how I got to this result under `artifacts.md`
    gcloud artifacts repositories list --format 'table(name.basename(),name.segment(3),sizeBytes.size(zero='0',precision=3,units_out=M))' --filter format='DOCKER'

## Troubleshooting

To craft the perfect query, I do this:

1. lazily use the --format json to see the exact name of ALL fields available.
1. Then I craft a --format or --filter based on those names.

You can usually trigger the full proto disclosure by making a mistake, like:

```bash
$ gcloud artifacts repositories list --format 'table(.blah)'
```

Actually no, this gives you the DEFAULT representation in TABLE way, which is even more informational.

See more under `artifacts.md` page.

## On Filtering and Formatting

Some generic documentation is here:

* `gcloud topic filters`: https://cloud.google.com/sdk/gcloud/reference/topic/filters
* `gcloud topic formats`: https://cloud.google.com/sdk/gcloud/reference/topic/formats

## Local Examples

In general the easy way is to use `--format json` and then unleash the `jq` power.

However, don't underestimate the power of gcloud.

More specific examples are under:

*  `artifacts.md` ([Artifact Repository](https://github.com/palladius/gcp-cheatsheets/blob/main/cheatsheets/gcloud/artifacts.md))
*  `compute.md` ([GCE](https://github.com/palladius/gcp-cheatsheets/blob/main/cheatsheets/gcloud/compute.md))
*  `deploy.md` ([Cloud Deploy](https://github.com/palladius/gcp-cheatsheets/blob/main/cheatsheets/gcloud/deploy.md))
*  `projects.md` ([Projects](https://github.com/palladius/gcp-cheatsheets/blob/main/cheatsheets/gcloud/projects.md))

