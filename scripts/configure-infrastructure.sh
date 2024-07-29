# Terminal text output colour variables: purple & default
p='\033[0;35m'
d='\033[0m'

echo -e "${p}Assign AKS Context:${d}" 
kubectl config use-context aks-cluster

echo -e "${p}Get Credentials To Use kubectl Commands${d}"
az aks get-credentials --resource-group djb993rg --name aks-cluster --overwrite-existing

echo -e "${p}Assign Admin Priveledges To Container Registry${d}"
az acr update --name djb993cr --resource-group djb993rg --admin-enabled true

echo -e "${p}Provide AKS cluster access to ACR to pull images${d}"
az aks update --name aks-cluster --resource-group djb993rg --attach-acr djb993cr