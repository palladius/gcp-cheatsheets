External links: https://kubernetes.io/docs/reference/kubectl/cheatsheet/ (awesome!)

Deployment fix:

    kubectl explain deployment   # cool manual page    

    kubectl explain deployment --recursive # super long, explain the proto.

    kubectl explain deployment.metadata.name

    kubectl get svc my-service -o=jsonpath="{.status.loadBalancer.ingress[0].ip}"` # get service IP
    curl -ks https://`kubectl get svc my-service -o=jsonpath="{.status.loadBalancer.ingress[0].ip}"` # gets HTTPS disabling TLS cert check.

    kubectl scale deployment my-deployment --replicas=5 # scale up existing deployment

    kubectl edit deployment hello # edit existing one "in the cloud" not in local yaml

Rolling updates / rollouts :

    kubectl rollout history deployment/hello
    kubectl rollout pause deployment/hello
    kubectl rollout status deployment/hello

Amazing! gets pods and for each pods tells you name and VERSION. Great for debugging rolling updates.. :)

    kubectl get pods -o jsonpath --template='{range .items[*]}{.metadata.name}{"\t"}{"\t"}{.spec.containers[0].image}{"\n"}{end}'
