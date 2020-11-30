
k8s homelab learning

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

check out `minikube addons list`


```
docker run --name nagios4  \
  -v /path-to-nagios/etc/:/opt/nagios/etc/ \
  -v /path-to-nagios/var:/opt/nagios/var/ \
  -v /path-to-custom-plugins:/opt/Custom-Nagios-Plugins \
  -v /path-to-nagiosgraph-var:/opt/nagiosgraph/var \
  -v /path-to-nagiosgraph-etc:/opt/nagiosgraph/etc \
  -p 0.0.0.0:8080:80 jasonrivers/nagios:latest
  ```