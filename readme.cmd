Build the docker image:

create Dockerfile and using the docker build command you can build the dockerfile.

docker build -t <applicationname>:v1 .<Dockerfile location>

once Docker image build, we need to tag the docker image with acr.

docker tag <applicationame>:v1 dockeracrpush.azurecr.io/<applicationame:v1>:v1

once docker tag completed authitated docker with acr to push the docker image to acr.

az acr login --name <acrname>

once login completed , you can push to acr.

docker push dockeracrpush.azurecr.io/<applicationame:v1>:v1 - it will push to acr.

once docker image is avaiable in acr, create AKS cluster using below command.

az aks create --resource-group docker-acr-push --name myAKSCluster --node-count 2 --enable-managed-identity --generate-ssh-keys

Once aks cluster is ready ,Connect AKS to ACR using below command.

az aks update -n docker-acr-push -g myResourceGroup --attach-acr dockeracrpush (This allows AKS to pull images from your private ACR without secrets.)

connect to aks cluster:
az account set --subscription 5e47e5a1-7dc4-4abb-87a2-f371200842ea

az aks get-credentials --resource-group docker-acr-push --name myAKSCluster --overwrite-existing

Deploy the Docker image to AKS:
create deployment.yaml file.
