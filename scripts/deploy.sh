# ===============================================================
#         This Shell File Deploys Both Microservices         
# ===============================================================
#            RUN - .scripts/deploy.sh  (in Git Bash)             
# ---------------------------------------------------------------

# Terminal text output colour variables: purple & default
p='\033[0;35m'
d='\033[0m'

set -euo pipefail

echo -e "\n${p}Deploying Microservices...${d}\n"

# Ensure KUBECONFIG is set
export KUBECONFIG="$HOME/secrets/kubeconfig.txt"

echo "KUBECONFIG in deploy.sh: $KUBECONFIG"

envsubst < ./scripts/kubernetes/deploy.yaml | kubectl apply -f -

echo -e "\n${p}Deployment complete.${d}\n"

# Display Status & Launch Browser
./scripts/display-status-launch-browser.sh