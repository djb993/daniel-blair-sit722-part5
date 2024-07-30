# ===============================================================
#         This Shell File Deploys Both Microservices         
# ===============================================================
#            RUN - .scripts/deploy.sh  (in Git Bash)             
# ---------------------------------------------------------------

# Terminal text output colour variables: purple & default
p='\033[0;35m'
d='\033[0m'

set -u # or set -o nounset
: "$CONTAINER_REGISTRY"
: "$VERSION"

echo -e "\n${p}Deploying Microservices...${d}\n"

echo "KUBECONFIG in deploy.sh: $KUBECONFIG"

envsubst < ./scripts/kubernetes/deployment.yaml | kubectl apply -f -

# Display Status & Launch Browser
./scripts/display-status-launch-browser.sh