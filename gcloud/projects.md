
This is a VERY interesting API call. To see projects you need to call it FROM within a project. This is important from billing and organizational perspective.
Of course it shouldn't make A LOT of difference if you change project, but it will fail if you have no empty project to start from.
This isn interesting pseudo-circular dependency.

For a list of projects created on or after 15 January 2018, sorted from oldest to newest, presented as a table with project number, project id and creation time columns with dates and times in local timezone:

   gcloud projects list --format="table(projectNumber,projectId,createTime.date(tz=LOCAL))" \
       --filter="createTime>=2018-01-15T12:00:00" --sort-by=createTime


To get a list of fields, IO like to first get a JSON file to see the rich schema/proto of what comes out. For instance, I can see 

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

So let's now capture the parent to see if it's Org or Folder :) 

     gcloud projects list --format="table(projectNumber,projectId,createTime.date(tz=LOCAL),parent)"    # This works but parent is scattered and not easy to grep.
	 gcloud projects list --format="table(projectNumber,projectId,createTime.date(tz=LOCAL),parent.type,parent.id)"   # much better      
	 