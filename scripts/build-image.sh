ACR_NAME="djb993cr"
# Terminal text output colour variables: purple, red & default
p='\033[0;35m' 
r='\033[0;31m'
d='\033[0m' 

echo -e "$\n${p}Building Images...${d}\n"

# Build Book Catalog Image
docker build -t $ACR_NAME.azurecr.io/book-catalog-service:1 ./book_catalog
if [ $? -eq 0 ]; then
    # Confirm Successful Build
    echo -e "\n${p}Built Docker Image: $ACR_NAME.azurecr.io/book-catalog-service:1${d}\n" 
else
    # Confirm Unsuccsessful Build
    echo -e "${r}Failed to build book-catalog-service image.${d}"
    exit 1
fi

# Build Inventory Management Image
docker build -t $ACR_NAME.azurecr.io/inventory-management-service:1 ./inventory_management
if [ $? -eq 0 ]; then
    # Confirm Successful Build
    echo -e "\n${p}Built Docker Image: $ACR_NAME.azurecr.io/inventory-management-service:1${d}\n"
else
    # Confirm Unsuccsessful Build
    echo -e "${r}Failed to build inventory-management-service image.${d}"
    exit 1
fi

############################# Build and Tag over multiple commands #############################
# docker build -t book-catalog-service:1 ./book_catalog
# docker build -t inventory-management-service:1 ./inventory_management
# docker tag book-catalog-service:1 $ACR_NAME.azurecr.io/book-catalog-service:1
# docker tag inventory-management-service:1 $ACR_NAME.azurecr.io/inventory-management-service:1