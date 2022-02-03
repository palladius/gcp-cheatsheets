---
title: "gcloud"
id: "gcloud"
linkTitle: "gcloud"
weight: 11
type: riccardolist
menu:
  main:
    weight: 11
---
riccardolist
Her eyou find: 
Asset / Auth

## use type: riccardolist

see https://gohugo.io/templates/lists/

{ {% mdshortcode %} }Stuff to `process` in the *center*.{ {% /mdshortcode %} }
{{< highlight go >}} A bunch of code here {{< /highlight >}}

{{ partial "layouts/riccardolist.html" . }}
{{ $_hugo_config := `{ "version": 1 }` }}

TODO put this somewhere in layouts//...
{{ range (where .Site.RegularPages "Section" "notes") }}
  ...
  {{ .Content }}
  ...
{{ end }}
