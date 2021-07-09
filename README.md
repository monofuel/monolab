
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


- was helm a good idea? I wanted to learn a new tool, but it feels like a complicated fit for my static homelab

- maybe check out using terraform for k8s? https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/deployment

# TF notes

- "could not find the record with hash" likely means my home IP changed and I need to update the whitelist

# TrueNAS notes

- use 1 dataset for each nfs share (for zfs reasons)

# TODO

- migrate orbital project AWS stuff
    - https://gitlab.com/monofuel34089/orbital

- mgmt containers
    - organizr
    - influxdb
    - grafana
    - chronograf
    - home-assistant
- set up iscsi mounts for containers that want sqlite
    - I think that's the easiest / best solution for now?
- figure out how nfs mounts work
    - media containers
        - sonarr
- openvpn servers?
- k8s openVPN clients?
- setup k8s in VMs on home servers
    - automate process with terraform & proxmox
- migrate DNS

- https://docs.gitlab.com/runner/install/kubernetes.html

- https://helm.sh/docs/intro/using_helm/

- check out `minikube addons list`

- persist nagios /var mounts?
- nagios liveness/readiness probes?
    - expects authorization by default


# Networking notes

nodes + all ports are only accessible via VPN or from LAN

ssh public key

```
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCr72JVAFDEQ4uRnb5RD9hAduM0pX5a+TU1ZJZ1483X1/s1n96lOWIIsedD9N9kFQrWdz94qY5p/B4YRmwOho/JCaUxBeQlDtEwXjItOukCsW+b/Z2dR7UAEOU+LKR/CYxiYFz1a4TmgdiBJ3fZ4kvx8ys/MfWgSFW8mt6oMcLsXit5HE/iCP9uIPJQR8DOFCbVNdgJqwRM6sDR7687V+3zKEUore1xpuy2O4ltblnn+aXBT+Gu231T4ExO6j6fDoJWSGbwRljV6GsKJzDDuJCAw828plLdW8g4O5aFbsuymAApF+9iRdj/IMf7s+t1tEHaF/9WtmcbCnJe6olEqAdnz7PmaEwKiLs/6kRuOse57702nP8EPgdV9InFcncia3GD0ot1HNdmpVWpo8GkIjW485/a4KhYC6BkqONOhnLFGrU++f+Apkzl9TJK5XsAk37L8WcKUufHhvRkxghc7Vrhfuj0WhpFANAsFXUABFhWR5Hp8ERGTCpScEw+KaoTcx8= monofuel@spectre
```

- farmlife pi
    - mac:     DC:A6:32:4C:63:5F
    - lan ip:  192.168.13.108
    - vpn ip:  10.0.20.38
- farmlife nas
    - nic1
        - mac:     d0:50:99:d5:19:3f
        - lan ip:  192.168.13.186
    - nic2
        - mac:     d0:50:99:d5:19:41
        - lan ip:  192.168.13.188
    - vpn
        - ip:      10.0.20.42

# UPS notes

- http://www.apcupsd.org/manual/manual.pdf