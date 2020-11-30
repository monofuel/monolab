#helm uninstall mgmt
# helm install mgmt ./nagios
# minikube mount ./data:/host
helm upgrade -i mgmt ./mgmt
minikube service --url mgmt-nagios