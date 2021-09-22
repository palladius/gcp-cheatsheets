
Log the Apache/Linux way (thanks Julio C)

    gcloud logging read --limit="100" --format="table(timestamp,severity,textPayload)" 'textPayload:*'

Returns something like this:

    2021-09-22T13:41:17.263930820Z  ERROR     This is BAAAD!
    2021-09-22T13:41:17.263930820Z  INFO      Second line (I know its upside down!)
    2021-09-22T13:41:17.055712380Z  INFO      First line of log
