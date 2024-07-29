# Terminal text output colour variables: purple & default
p='\033[0;35m'
d='\033[0m'

echo -e "${p}Navigate to Terraform Directory${d}"
cd ./terraform
echo -e "${p}Initialise Terraform${d}"
terraform init
echo -e "\n${p}Validate Terraform Files${d}"
terraform validate
echo -e "${p}Procure Azure Platform Resources...${d}"
terraform apply -auto-approve
echo -e "${p}Return to root directory${d}"
cd .. 
pwd
