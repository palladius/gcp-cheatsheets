
I don't see way to interact with Monitoring beautifully via gcloud.
Only with client libraries, example:

* Node.JS: https://www.npmjs.com/package/@google-cloud/monitoring#using-the-client-library
* Ruby: https://cloud.google.com/monitoring/docs/reference/libraries#client-libraries-install-ruby
  (-> [github](https://github.com/googleapis/google-cloud-ruby/blob/HEAD/google-cloud-monitoring/samples/quickstart.rb))

Describe policy ([url](https://cloud.google.com/monitoring/alerts/policies-in-json)):

```bash
gcloud alpha monitoring policies describe projects/a-gcp-project/alertPolicies/12669073143329903307 > test-policy.yaml
Per generare rappresentazioni JSON dei criteri di avviso esistenti e dei canali di notifica:
```
