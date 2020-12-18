$minikubeIP = $(minikube ip)

echo "minikube IP " $minikubeIP

docker build -t dev-image:latest dev-image
minikube cache add dev-image:latest
