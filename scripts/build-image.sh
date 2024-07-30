# Terminal text output colour variables: purple & default
p='\033[0;35m' 
d='\033[0m' 

set -u # or set -o nounset
: "$CONTAINER_REGISTRY"
: "$VERSION"

echo -e "$\n${p}Building Images...${d}\n"
echo -e "$\n${p}$CONTAINER_REGISTRY${d}\n"

# Build Book Catalog Image
docker build -t $CONTAINER_REGISTRY/book-catalog-service:$VERSION --file ./book_catalog .

# Build Inventory Management Image
docker build -t $CONTAINER_REGISTRY/inventory-management-service:$VERSION --file ./inventory_management .

