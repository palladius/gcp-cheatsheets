
Associate a billing account:

    # If you have the BAID:
    gcloud beta billing projects link "my-project-id" --billing-account "012345-ABCDEF-678901"

If you don't know the BAID by heart:

    🐼 gcloud beta billing accounts list
    ACCOUNT_ID            NAME                                                       OPEN   MASTER_ACCOUNT_ID
    0006EA-ABCDEF-23BCBF  Billing Account for Blah blah blash                        False
    000E23-ABCDEF-165177  Billing Account for Foo Bar Baz                            True
    [..]


## Docs

* https://cloud.google.com/billing/docs/how-to/modify-project
