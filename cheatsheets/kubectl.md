External links: https://kubernetes.io/docs/reference/kubectl/cheatsheet/ (awesome!)

## Combo

This sub-pagrapha combines commands for awesomer results:

	kubectl create deployment nginx --image=nginx:1.10.0 # Pod with Nginx
	kubectl expose deployment nginx --port 80 --type LoadBalancer   # Creates GCP NLB with IP and exposes above service. wOOOt!
	kubectl get services # shows IP address of LB.

## Deployments

	kubectl create deployment nginx --image=nginx:1.10.0        # Starts a new deployment with ngnix image

Explain what a deployment is:

    kubectl explain deployment   # cool manual page

    kubectl explain deployment --recursive # super long, explain the proto.

    kubectl explain deployment.metadata.name


    kubectl scale deployment my-deployment --replicas=5 # scale up existing deployment

    kubectl edit deployment hello # edit existing one "in the cloud" not in local yaml

## Pods

Note: This is anything related to a pod, but not neccesarily the commands are about kubectl VERB pod.

Amazing! gets pods and for each pods tells you name and VERSION. Great for debugging rolling updates with -watch .. :)

    kubectl get pods -o jsonpath --template='{range .items[*]}{.metadata.name}{"\t"}{"\t"}{.spec.containers[0].image}{"\n"}{end}'

Other interesting options:

	kubectl get pods -l "app=monolith,secure=enabled"
	kubectl label pods secure-monolith 'secure=enabled'
	kubectl get pods --show-labels


Creates a procy from llocalhost:10000 and your pod:80 in the cloud:

	kubectl port-forward mypod 10080:80

See logs for pod:

    kubectl logs monolith

Execute (beware, can screw up your env!):

	kubectl exec monolith --stdin --tty -c monolith /bin/sh      # execute shell on existing monolith
	kubectl exec -it my-pod --container main-app -- /bin/bash    # execute container main-app in multi-container pod


## Rolling updates / rollouts :

    kubectl rollout history deployment/hello
    kubectl rollout pause deployment/hello
    kubectl rollout status deployment/hello


## Services

    kubectl get svc my-service -o=jsonpath="{.status.loadBalancer.ingress[0].ip}"` # get service IP
    curl -ks https://`kubectl get svc my-service -o=jsonpath="{.status.loadBalancer.ingress[0].ip}"` # gets HTTPS disabling TLS cert check.
