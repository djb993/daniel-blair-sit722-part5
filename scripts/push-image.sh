ACR_NAME="djb993cr"
# Terminal text output colour variables: purple, red & default
p='\033[0;35m' 
r='\033[0;31m'
d='\033[0m' 

# Login to enable Docker Commands to interact with the Container Registry
echo -e "${p}Logging In To Container Registry${d}"
az acr login --name $ACR_NAME

echo -e "${p}\nPushing Images...${d}\n"

# Push Book Catalog Image
docker push $ACR_NAME.azurecr.io/book-catalog-service:1
if [ $? -eq 0 ]; then
    # Confirm Successful Push
    echo -e "\n${p}Pushed Docker Image: $ACR_NAME.azurecr.io/book-catalog-service:1 to Azure Container Registry${d}\n"
else
    # Confirm Unsuccessful Push
    echo -e "\n${r}Failed to push book-catalog-service image.${d}\n"
    exit 1
fi

# Push Inventory Management Image
docker push $ACR_NAME.azurecr.io/inventory-management-service:1
if [ $? -eq 0 ]; then
    # Confirm Successful Push
    echo -e "\n${p}Pushed Docker Image: $ACR_NAME.azurecr.io/inventory-management-service:1 to Azure Container Registry${d}\n"
else
    # Confirm Unsuccessful Push
    echo -e "\n${r}Failed to push inventory-management-service image.${d}\n"
    exit 1
fi
