# ☁️ Monolithic Azure Landing Zone with Terraform

> 🚀 **Infrastructure as Code (IaC) implementation of a monolithic Azure Landing Zone using Terraform.**

This repository contains a **Terraform-based Azure infrastructure deployment** designed to provision the core components required for hosting and securing workloads in Microsoft Azure.

The project focuses on **networking, compute, security, secrets management, and application traffic management** using reusable Terraform configurations.

---

## 🏗️ Architecture

The Landing Zone provisions the following Azure resources:

* 📦 **Resource Group**
* 🌐 **Virtual Network (VNet)**
* 🔹 **Subnets**
* 🛡️ **Network Security Group (NSG)**
* 🌍 **Public IP**
* 🚪 **Azure Bastion**
* 💻 **Virtual Machine**
* 🔐 **Azure Key Vault**
* ⚡ **Application Gateway**

### 🔄 High-Level Flow

```text
                         🌍 Internet
                              │
                              ▼
                    ┌──────────────────┐
                    │ Application      │
                    │ Gateway          │
                    └────────┬─────────┘
                             │
                             ▼
                    ┌──────────────────┐
                    │      VNet        │
                    │                  │
                    │  ┌────────────┐  │
                    │  │ App Subnet │  │
                    │  │            │  │
                    │  │    💻 VM   │  │
                    │  └────────────┘  │
                    │                  │
                    │  ┌────────────┐  │
                    │  │   Bastion   │  │
                    │  │     🚪      │  │
                    │  └────────────┘  │
                    │                  │
                    └──────────────────┘
                             │
                             ▼
                       🔐 Key Vault

                    🛡️ NSG → Network Security
                    🌍 Public IP → Internet Access
```

---

## 📦 Resources Provisioned

| Resource              | Purpose                                                |
| --------------------- | ------------------------------------------------------ |
| 📦 Resource Group     | Logical container for Azure resources                  |
| 🌐 Virtual Network    | Provides private network connectivity                  |
| 🔹 Subnets            | Segments the VNet into logical network zones           |
| 🛡️ NSG               | Controls inbound and outbound network traffic          |
| 🌍 Public IP          | Provides public connectivity where required            |
| 🚪 Azure Bastion      | Secure VM access without exposing RDP/SSH publicly     |
| 💻 Virtual Machine    | Compute workload                                       |
| 🔐 Key Vault          | Secure storage for secrets and sensitive configuration |
| ⚡ Application Gateway | Layer 7 traffic routing and application delivery       |

---

## 🛠️ Technologies Used

* ☁️ **Microsoft Azure**
* 🏗️ **Terraform**
* 🔧 **AzureRM Terraform Provider**
* 🐙 **Git / GitHub**
* 🔄 **Infrastructure as Code (IaC)**

---

## 📁 Project Structure

```text
Monolithic-Landing-Zone/
│
├── 📄 provider.tf
├── 📄 variables.tf
├── 📄 terraform.tfvars
├── 📄 outputs.tf
├── 📄 main.tf
│
├── 📁 modules/
│   ├── 📁 resource-group/
│   ├── 📁 networking/
│   ├── 📁 nsg/
│   ├── 📁 bastion/
│   ├── 📁 vm/
│   ├── 📁 key-vault/
│   └── 📁 application-gateway/
│
└── 📄 README.md
```

> 📌 *Update the folder structure above according to the actual structure of your repository.*

---

## ⚙️ Prerequisites

Before deploying the infrastructure, make sure you have:

* ✅ An active Azure subscription
* ✅ Azure CLI installed
* ✅ Terraform installed
* ✅ Git installed
* ✅ Appropriate Azure permissions

Check the installations:

```bash
az --version
terraform --version
git --version
```

---

## 🔐 Azure Authentication

Login to Azure using Azure CLI:

```bash
az login
```

Verify the active subscription:

```bash
az account show
```

If you have multiple subscriptions:

```bash
az account list
```

Set the required subscription:

```bash
az account set --subscription "<SUBSCRIPTION_ID>"
```

---

## 🚀 Deployment

### 1️⃣ Clone the Repository

```bash
git clone <YOUR-REPOSITORY-URL>
```

```bash
cd Monolithic-Landing-Zone
```

---

### 2️⃣ Initialize Terraform

```bash
terraform init
```

This downloads the required Terraform providers and initializes the working directory.

---

### 3️⃣ Validate Configuration

```bash
terraform validate
```

Expected result:

```text
Success! The configuration is valid.
```

---

### 4️⃣ Format Terraform Files

```bash
terraform fmt -recursive
```

---

### 5️⃣ Review the Execution Plan

```bash
terraform plan
```

Review the resources Terraform is going to create before applying the configuration.

---

### 6️⃣ Deploy Infrastructure 🚀

```bash
terraform apply
```

Review the proposed changes and enter:

```text
yes
```

Terraform will provision the required Azure infrastructure.

---

## 🗑️ Destroy Infrastructure

⚠️ **Warning:** This will delete resources managed by the Terraform configuration.

```bash
terraform destroy
```

Review the changes carefully before confirming.

---

## 🔒 Security Considerations

This project includes several Azure security components:

### 🛡️ Network Security Group

NSGs can be used to control network traffic based on:

* Source
* Destination
* Port
* Protocol
* Direction

### 🚪 Azure Bastion

Azure Bastion provides secure RDP/SSH connectivity to VMs without requiring direct public IP exposure on the VM.

### 🔐 Azure Key Vault

Key Vault can be used to securely manage:

* 🔑 Secrets
* 🔐 Keys
* 📜 Certificates

Avoid storing sensitive values directly inside Terraform files.

### 🌐 Application Gateway

Application Gateway provides application-level traffic management and can be configured for:

* HTTP/HTTPS traffic
* Backend pools
* Health probes
* Routing rules
* TLS/SSL termination

---

## 🔄 Terraform Workflow

```text
        📝 Write Configuration
                 │
                 ▼
          terraform init
                 │
                 ▼
        terraform validate
                 │
                 ▼
           terraform fmt
                 │
                 ▼
          terraform plan
                 │
                 ▼
          terraform apply
                 │
                 ▼
        ☁️ Azure Resources
```

---

## 📤 Terraform Outputs

After deployment, Terraform can expose useful information such as:

```bash
terraform output
```

Examples:

* 🌐 Application Gateway Public IP
* 💻 VM information
* 🔐 Key Vault information
* 🌐 VNet information

---

## 💡 Key Features

✨ Infrastructure deployed entirely using Terraform

✨ Repeatable and consistent Azure deployments

✨ Modular infrastructure design

✨ Secure VM connectivity using Azure Bastion

✨ Network traffic control using NSGs

✨ Secret management using Azure Key Vault

✨ Application traffic management using Application Gateway

✨ Infrastructure as Code approach

---

## 📌 Future Improvements

The project can be extended with:

* 🔄 Azure DevOps CI/CD pipeline
* 🗂️ Remote Terraform State using Azure Storage
* 🔐 Managed Identity
* 🛡️ Azure Policy
* 📊 Azure Monitor & Log Analytics
* 🔒 Private Endpoints
* 🌐 HTTPS/TLS configuration
* 🌎 Multi-environment deployment
* ♻️ Reusable Terraform modules

---

## 👨‍💻 Author

**Ankit Gupta**

💼 Azure | Terraform | DevOps | Cloud Infrastructure

---

## ⭐ Support

If you found this project useful, consider giving the repository a ⭐ on GitHub!

---

### 📜 License

This project is intended for **learning and demonstration purposes**. Add an appropriate license if you plan to distribute or reuse the code publicly.
# Monolithic-Landing-Zone
Infrastructure as Code (IaC) implementation of a monolithic Azure Landing Zone using Terraform, provisioning networking, compute, security, and application delivery components.
