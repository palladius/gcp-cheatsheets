
Log the Apache/Linux way (thanks Julio C)

    gcloud logging read --limit="100" --format="table(timestamp,severity,textPayload)" 'textPayload:*'

Returns something like this:

    2021-09-22T13:41:17.263930820Z  ERROR     This is BAAAD!
    2021-09-22T13:41:17.263930820Z  INFO      Second line (I know its upside down!)
    2021-09-22T13:41:17.055712380Z  INFO      First line of log


## Payload examples

Both from UI and from CLI you can call different payloads. You can constrain a
number of things. In my experience, if you force the search to be smaller on fields which
are indexed, the search time might decreasa from 1 minute to 3 seconds.

    # Search for Kubernetes logs in September 2021 matching a certain severity
    # and log string regex. Good to find outages or similar.
    resource.type="k8s_container" AND
    timestamp>"2021-09-01T00:00:01Z" and timestamp<"2021-09-30T23:59:59Z" AND
    severity=(EMERGENCY OR ALERT OR CRITICAL OR ERROR OR WARNING) AND
    jsonPayload.message =~".*remember to put dot stars on left and right.*"
    this_field_needs_to_exist:*

In general it's smarter to log in JSON format so you can do exact queries, but
of course this isn't always available (eg, your cheap docker containers written
by 3rd-party), so you need to become good at both.

More examples are in the offical page:
https://cloud.google.com/logging/docs/view/advanced-queries
