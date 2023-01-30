
This is a VERY interesting API call. To see projects you need to call it FROM within a project. This is important from billing and organizational perspective.
Of course it shouldn't make A LOT of difference if you change project, but it will fail if you have no empty project to start from.
This isn interesting pseudo-circular dependency.

For a list of projects created on or after 15 January 2018, sorted from oldest to newest, presented as a table with project number, project id and creation time columns with dates and times in local timezone:

    gcloud projects list --format="table(projectNumber,projectId,createTime.date(tz=LOCAL))" \
       --filter="createTime>=2018-01-15T12:00:00" --sort-by=createTime


To get a list of fields, IO like to first get a JSON file to see the rich schema/proto of what comes out. For instance, I can see

```
    $ gcloud projects list --format=json # produces something like this
    {
      "createTime": "2013-03-20T09:23:43.062Z",
      "lifecycleState": "ACTIVE",
      "name": "PalladiusIt",
      "parent": {
        "id": "529046213280",
        "type": "folder"
      },
      "projectId": "palladius.it:palladiusit",
      "projectNumber": "197664194848"
    },
```

So let's now capture the parent to see if it's Org or Folder :)

```bash
# This works but parent is scattered and not easy to grep.
gcloud projects list --format="table(projectNumber,projectId,createTime.date(tz=LOCAL),parent)"
# much better
gcloud projects list --format="table(projectNumber,projectId,createTime.date(tz=LOCAL),parent.type,parent.id)"
```
To list Billing Account associated to a projects, the `gcloud projects` won't help (ATM). But you can list all projects
linked to a particular BAID; for this, see `billing.md` (TODO(ricc): hugo permalink)

## Projects to be cancelled

This highlights all projects about to be deleted:

    gcloud projects list --filter='lifecycleState:DELETE_REQUESTED' # or `ACTIVE`

And this shows first N highlighting a lot of interesting stuff:

```bash
gcloud projects list \
  --format="table(createTime.date(tz=LOCAL),projectNumber,projectId,parent.type,parent.id,lifecycleState,name)" \
  --limit 50

```
