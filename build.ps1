$minikubeIP=$(minikube ip)

echo "minikube IP " $minikubeIP

docker build -t test-image:latest test-image
minikube cache add test-image:latest