🚀 Full CI/CD Pipeline on Azure with Jenkins, SonarQube, DockerHub & ArgoCD (Terraform + Ansible + Minikube)

This project automates a complete CI/CD pipeline deployment using:

☁️ Azure Infrastructure (Terraform)

⚙️ Jenkins + SonarQube Setup (Ansible)

🐳 DockerHub for image storage

🚀 Argo CD + Minikube for Kubernetes deployment


🧱 Step 1: Provision Azure Resources Using Terraform

📁 Navigate to the Terraform folder:

cd terraform/

🔧 Initialize Terraform

terraform init

🚀 Apply the Terraform Configuration

terraform apply

👉 Confirm with yes when prompted.

✅ Terraform will provision the following Azure resources:

Resource Type | Name | Details
🌐 Resource Group | jenkins-rg | Region: East US
🧭 Virtual Network | jenkins-vn | Address Space: 10.0.0.0/16
🧱 Subnet | jenkins-subnet | Address Prefix: 10.0.1.0/24
🌍 Public IP | jenkins-public-ip | Dynamic Allocation, Basic SKU
🔐 Network Security Group | jenkins-nsg | Inbound: 22 (SSH), 8080 (Jenkins), 9000 (SonarQube)
🌐 Network Interface | jenkins-nic | Dynamic Private IP, Linked Public IP
💻 Linux VM | jenkins-vm | Ubuntu 22.04 LTS, Standard_F2

🌐 Step 2: Get Public IP of the Jenkins VM

Once deployed, retrieve the public IP using:

az vm list-ip-addresses \
  --resource-group jenkins-rg \
  --name jenkins-vm \
  --query "[].virtualMachine.network.publicIpAddresses[].ipAddress" \
  --output tsv


or by going to the Azure Portal and navigating to the VM.


⚙️ Step 3: Install Jenkins & SonarQube Agents Using Ansible

📁 Navigate to the Ansible folder:

cd ansible/

📜 Run the Ansible Playbook:

ansible-playbook -i inventory.ini setup-jenkins-sonarqube.yml

✅ This will:

Install Jenkins agent on the Azure VM

Install SonarQube agent on the same VM

Install Docker Deamon on the VM

Ensure all dependencies and services are up and running

🧠 Notes

Ensure your SSH key (~/.ssh/id_rsa.pub) exists and is added to the VM using Terraform.

Update inventory.ini with the public IP after VM creation.

Ansible requires python3, sshpass, and ansible installed on your local machine.

🏁 Result
After following all the steps, you’ll have:

✅ A Jenkins CI server running on port 8080

✅ SonarQube agent configured and ready on port 9000

✅ Infrastructure deployed and configured automatically 🎉


🧑‍💻 Step 3: Jenkins CI Pipeline with SonarQube + DockerHub
🔧 Jenkins Plugins to Install

SonarQube Scanner

Docker Pipeline

Type | ID 
Username/Password | docker
Secret Text | sonarqube
Secret Text | github

🧵 Step 4: Argo CD Deployment with Minikube (GitOps)
📌 Prerequisites
✅ Install Minikube

✅ Install Argo CD

✅ Create Kubernetes manifests for your app (e.g., deployment.yaml, service.yaml, ingress.yaml)



📦 Connect App Repo to Argo CD
Push your K8s YAMLs to a GitHub repo

In Argo CD UI:

Create New App

App Name: your-app

Repo URL: 

Path: 

Cluster: 

Namespace: default

✅ Argo CD will:

Pull latest K8s manifests from GitHub

Deploy DockerHub image to Minikube

Sync changes automatically (or manually)


🔚 Outcome
✅ Jenkins & SonarQube fully set up on Azure VM
✅ Docker image pushed to DockerHub
✅ Argo CD syncs YAML from Git → deploys on Minikube
✅ Full CI/CD + GitOps pipeline on local and cloud hybrid



