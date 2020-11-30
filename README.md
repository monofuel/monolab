
k8s homelab learning

build.ps1 to build & push custom images (not used currently)
apply.ps1 to apply helm charts



# Notes

- start `minikube start --driver=hyperv`
- `minikube config set driver hyperv`
- `minikube addons enable registry`

- can push images to cluster with `minikube cache add alpine:latest`

- can build images and push with registry addon
    - https://minikube.sigs.k8s.io/docs/handbook/pushing/#4-pushing-to-an-in-cluster-using-registry-addon

- docker build --tag $(minikube ip):5000/test-img .
- docker push $(minikube ip):5000/test-img

- minikube service --url mgmt-nagios

# TODO

- https://helm.sh/docs/intro/using_helm/

- check out `minikube addons list`

- persist nagios /var mounts?
- nagios liveness/readiness probes?
    - expects authorization by default