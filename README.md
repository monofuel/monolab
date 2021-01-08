
k8s homelab learning

build.ps1 to build & push custom images (not used currently)
apply.ps1 to apply helm charts

TODO reworking to use a kubernetes cluster instead of minikube


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

- mgmt containers
    - organizr
    - influxdb
    - grafana
    - chronograf
    - home-assistant
- figure out how nfs mounts work
    - media containers
        - plex
        - sabnzbd
        - sonarr
        - radarr
- openvpn servers
- k8s openVPN clients
- setup k8s in VMs on home servers


- https://docs.gitlab.com/runner/install/kubernetes.html

- https://helm.sh/docs/intro/using_helm/

- check out `minikube addons list`

- persist nagios /var mounts?
- nagios liveness/readiness probes?
    - expects authorization by default