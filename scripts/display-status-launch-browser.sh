# Terminal text output colour variables: purple & default
p='\033[0;35m'
d='\033[0m'

echo -e "\n${p}Waiting 60 seconds for container creation to complete...${d}\n"
sleep 60

echo "----------------------------------- Active Pods -----------------------------------"
echo "-----------------------------------------------------------------------------------"
kubectl get pods
echo -e "-----------------------------------------------------------------------------------\n"

echo "------------------------------------- Active Services ----------------------------------------- "
echo "-----------------------------------------------------------------------------------------------" 
kubectl get services
echo -e "-----------------------------------------------------------------------------------------------\n"

echo "---------------------------- Active Deployments ----------------------"
echo "----------------------------------------------------------------------"
kubectl get deployments
echo -e "----------------------------------------------------------------------\n"

echo -e "${p}Waiting 20 seconds to ensure External IPs have initiated...${d}\n"
sleep 20

# Get External IP addresses
BOOK_CATALOG_IP=$(kubectl get service book-catalog-service -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
INVENTORY_MANAGEMENT_IP=$(kubectl get service inventory-management-service -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
# Get External Ports
BOOK_CATALOG_PORT=$(kubectl get service book-catalog-service -o jsonpath='{.spec.ports[0].port}')
INVENTORY_MANAGEMENT_PORT=$(kubectl get service inventory-management-service -o jsonpath='{.spec.ports[0].port}')
# Define Service URLs
BOOK_CATALOG_URL="http://$BOOK_CATALOG_IP:$BOOK_CATALOG_PORT/docs"
INVENTORY_MANAGEMENT_URL="http://$INVENTORY_MANAGEMENT_IP:$INVENTORY_MANAGEMENT_PORT/docs"

echo "---------------------------------- Service URLS -----------------------------------"
echo "-----------------------------------------------------------------------------------"
echo BOOK CATALOG URL = "http://$BOOK_CATALOG_IP:$BOOK_CATALOG_PORT/docs"
echo INVENTORY MANAGEMENT URL = "http://$INVENTORY_MANAGEMENT_IP:$INVENTORY_MANAGEMENT_PORT/docs"
echo -e "-----------------------------------------------------------------------------------\n"

# Launch Browser Showing Services
echo -e "${p}Opening Services in Browser Shortly...${d}"
sleep 30
start "" "chrome.exe" --new-window "$BOOK_CATALOG_URL" "$INVENTORY_MANAGEMENT_URL"