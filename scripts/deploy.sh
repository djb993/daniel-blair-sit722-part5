### Launch file using .scripts/deploy.sh (in Git Bash) ###
# print colour
p='\033[0;35m'
d='\033[0m'

# Deploy Microservices
echo -e "\n${p}Deploying Microservices...${d}\n" 
kubectl apply -f ./scripts/kubernetes/deployment.yaml
