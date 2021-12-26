This part allows you to UPDATE gcloud and to install subcomponents which might be useful to you.

    gcloud components list

My favorite:

    # install Skaffold, useful for Cloud Deploy and in general to shiftleft your
    # CICD pipeline.
    gcloud components install skaffold

    # for K8s development may I suggest to try these ones:
    gcloud components install kubectl minikube
    # also useful: nomos was developed by my friend Ray C. 
    gcloud components install nomos  kustomize kpt 
    