# Terminal text output colour variables: purple & default
p='\033[0;35m' 
d='\033[0m' 

set -u # or set -o nounset
# Set default values if environment variables are not set
: "${CONTAINER_REGISTRY:="djb993cr.azurecr.io"}"

# Use GitHub Secrets if set, otherwise retrieve credentials using Azure CLI
REGISTRY_UN="${REGISTRY_UN:-$(az acr credential show --name djb993cr --query "username" --output tsv)}"
REGISTRY_PW="${REGISTRY_PW:-$(az acr credential show --name djb993cr --query "passwords[0].value" --output tsv)}"

# Login to Azure Container Registry automatically
az acr login --name ${CONTAINER_REGISTRY%%.*}  # Extracts the registry name from the URL

echo -e "${p}\nPushing Images...${d}\n"

echo $REGISTRY_PW | docker login $CONTAINER_REGISTRY --username $REGISTRY_UN --password-stdin

docker push $CONTAINER_REGISTRY/book-catalog-service:1
docker push $CONTAINER_REGISTRY/inventory-management-service:1


