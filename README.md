# 🚀 Azure Landing Zone Setup with Terraform ☁️

Welcome to the **Azure Landing Zone** infrastructure as code (IaC) repository! 🛠️ This project leverages Terraform to provision a scalable, secure, and robust foundation on Microsoft Azure.

---

## 🎯 Overview

This repository uses a **Parent-Child Module Architecture** 🧩 to deploy standard Azure resources. It makes managing and scaling your infrastructure simple and modular!

### 🏗️ Architecture Components
The following resources are managed by this Terraform configuration:
- 🗂️ **Resource Groups**: Logical containers for your Azure resources.
- 💾 **Storage Accounts & Containers**: Secure data storage solutions.
- 🌐 **Virtual Networks (VNet) & Subnets**: Network boundaries and isolated zones.
- 🌍 **Public IPs**: Internet-facing endpoints.
- 🛡️ **Network Security Groups (NSG)**: Traffic filtering rules for secure access.
- 🔌 **Network Interface Cards (NIC)**: Connecting VMs to the network.
- 🐧 **Linux Virtual Machines**: Compute resources (Ubuntu server).
- 🏰 **Azure Bastion**: Secure and seamless RDP/SSH connectivity to VMs directly from the Azure portal.

---

## 📂 Repository Structure

```text
📦 Landing-Zone-001
 ┣ 📂 Child module (Reusable modules)
 ┃ ┣ 📂 1-Azurerm_Resource_Group
 ┃ ┣ 📂 2-Azurerm_Storage_Account
 ┃ ┣ 📂 3-Azurerm_Containers
 ┃ ┣ 📂 4-Azurerm_Virtual_Network
 ┃ ┣ 📂 5-Azurerm_Subnet
 ┃ ┣ 📂 6-Azurerm_public_IP
 ┃ ┣ 📂 7-Azurern_Network_Interface_Card
 ┃ ┣ 📂 8-Azurerm_Network_Security_Group
 ┃ ┣ 📂 9-Azurerm_NSG_NIC_Association
 ┃ ┣ 📂 10-Azurerm_Virtual_Machine
 ┃ ┗ 📂 11-Azurerm_Bastian
 ┣ 📂 Parent module (Main execution directory)
 ┃ ┣ 📜 Main.tf (Module invocations)
 ┃ ┣ 📜 Provider.tf (Azure provider config)
 ┃ ┣ 📜 Variable.tf (Variable declarations)
 ┃ ┗ 📜 Terraform.tfvars (Input values)
 ┗ 📜 README.md
```

---

## 🛠️ Prerequisites

Before you begin, ensure you have the following installed and configured:
1. [Terraform](https://developer.hashicorp.com/terraform/downloads) ⚙️
2. [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) 🟦
3. An active **Azure Subscription** 💳.

**Login to Azure:**
```bash
az login
```

---

## 🚀 How to Run

Follow these steps to deploy the infrastructure:

1. **Navigate to the Parent Module:**
   ```bash
   cd "Parent module"
   ```

2. **Initialize Terraform:**
   This downloads the required Azure provider plugins.
   ```bash
   terraform init
   ```

3. **Format and Validate Code:**
   Keep the code clean and check for syntax errors.
   ```bash
   terraform fmt
   terraform validate
   ```

4. **Review the Execution Plan:**
   See exactly what resources will be created/modified.
   ```bash
   terraform plan
   ```

5. **Apply the Changes:**
   Deploy the infrastructure to Azure! 🚀
   ```bash
   terraform apply -auto-approve
   ```

---

## 🧹 Clean Up

To avoid unnecessary costs, destroy the resources when you are done exploring:
```bash
terraform destroy -auto-approve
```

---

## 🤝 Contribution & Learnings

Feel free to customize the `Terraform.tfvars` file to adapt the infrastructure to your own needs! Happy Terraforming! 💻✨
