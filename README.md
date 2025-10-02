# AWS Infrastructure Automation

This repository contains Terraform code and GitHub Actions workflows to automate the provisioning of AWS infrastructure.  
It builds a VPC, subnets, route tables, security groups, and EC2 instances with provisioning scripts.

---

## 🚀 Features
- Automated AWS infrastructure deployment using **Terraform**
- Infrastructure as Code (IaC) with modular structure
- GitHub Actions pipeline for CI/CD
- Resources provisioned:
  - VPC
  - Public & private subnets
  - Route tables
  - Security groups
  - EC2 instance with user data

---

## ⚙️ Configuration

### Prerequisites
- [Terraform](https://developer.hashicorp.com/terraform/downloads) installed (>=1.5+)
- AWS account with programmatic access
- AWS CLI configured with credentials (`aws configure`)

---

### Backend Setup (Manual Step Required)
This project uses **remote state** stored in an S3 bucket with DynamoDB state locking.  
⚠️ **These are NOT created by Terraform** — you must create them manually before running Terraform.

You have two options:

#### 🔹 Option 1: Using AWS CLI
1. Create an S3 bucket (example: `my-terraform-backend`):  
   ```bash
   aws s3api create-bucket --bucket my-terraform-backend --region us-east-1
   ```
2.	Create a DynamoDB table for state locking (example: terraform-locks):
   ```
  aws dynamodb create-table \
    --table-name terraform-locks \
    --attribute-definitions AttributeName=LockID,AttributeType=S \
    --key-schema AttributeName=LockID,KeyType=HASH \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5
```
#### 🔹 Option 2: Using AWS Management Console (UI)
If you’re not familiar with CLI/commands, you can set these up via the AWS Console:

- Go to **S3 → Create Bucket**  
  - Choose a unique bucket name (e.g., `my-terraform-backend`)  
  - Select your region  
  - Create the bucket  

- Go to **DynamoDB → Create Table**  
  - Table name: `terraform-locks`  
  - Partition key: `LockID` (String)  
  - Leave other settings as defaults  
  - Create the table  
---

## Update terraform.tfvars

Once your backend is ready, update terraform.tfvars with the names of your bucket and DynamoDB table:
```
s3_bucket_name        = "my-terraform-backend"
dynamodb_table_name  = "terraform-locks"
```

### Files
	- provider.tf → Configures AWS provider
	-	backend.tf → Configures Terraform remote backend (uses your S3 + DynamoDB)
	-	variable.tf → Defines input variables
	-	terraform.tfvars → Stores variable values (update before apply)
	-	main.tf → Main infrastructure resources
	-	output.tf → Exposes output values

## 🔑 GitHub Secrets (Required)

Since this project automates infrastructure using GitHub Actions, you must configure secrets in your repository before running workflows.

Go to:
GitHub Repo → Settings → Secrets and variables → Actions

Add the following secrets:
	-	AWS_ACCESS_KEY_ID → Your AWS Access Key
	-	AWS_SECRET_ACCESS_KEY → Your AWS Secret Key
	-	SSH_PUBLIC_KEY  → Your AWS Public Key
  - SSH_PRIVATE_KEY  → Your AWS Private Key
