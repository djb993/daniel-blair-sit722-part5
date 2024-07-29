# ===============================================================
#         This Shell File Deploys Both Microservices         
# ===============================================================
#            RUN - .scripts/deploy.sh  (in Git Bash)             
# ---------------------------------------------------------------

# Terminal text output colour variables: purple & default
p='\033[0;35m'
d='\033[0m'


# Provision Infrastructure
./scripts/provision-infrastructure.sh

# Build Images 
./scripts/build-image.sh

# Push Images
./scripts/push-image.sh

# Configure Infrastructure
./scripts/configure-infrastructure.sh

# Deploy Microservices
echo -e "\n${p}Deploying Microservices...${d}\n" 
kubectl apply -f ./scripts/kubernetes/deployment.yaml

# Display Status & Launch Browser
./scripts/display-status-launch-browser.sh
