# Terminal text output colour variables: purple & default
p='\033[0;35m' 
d='\033[0m' 

set -u # or set -o nounset
# Set default values if environment variables are not set
: "${CONTAINER_REGISTRY:="djb993cr.azurecr.io"}"
# VERSION=${VERSION:="latest"}

echo -e "$\n${p}Building Images...${d}\n"
# echo -e "$\n${p}$CONTAINER_REGISTRY${d}\n"

# Build Book Catalog Image
docker build -t $CONTAINER_REGISTRY/book-catalog-service:1 ./book_catalog

# Build Inventory Management Image
docker build -t $CONTAINER_REGISTRY/inventory-management-service:1 ./inventory_management


