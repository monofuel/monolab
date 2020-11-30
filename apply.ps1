#helm uninstall mgmt
# helm install mgmt ./nagios
# minikube mount ./data:/host
helm upgrade -i mgmt ./nagios
minikube service --url mgmt-nagios