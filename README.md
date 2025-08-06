

```markdown
# ![](https://www.vectorlogo.zone/logos/terraformio/terraformio-icon.svg) Terraform Multi-Environment AWS Infrastructure Deployment

A modular and reusable **Terraform project** for provisioning AWS infrastructure across multiple environments (e.g., `dev`, `staging`, `prod`). This setup includes resources like **EC2**, **S3**, and **DynamoDB**, following infrastructure-as-code (IaC) principles.

---

## 📁 Project Structure

```bash
.
├── infra-eks-app/            # Reusable Terraform module
│   ├── dynamodb.tf           # DynamoDB resource configuration
│   ├── ec2.tf                # EC2 resource configuration
│   ├── s3.tf                 # S3 bucket resource configuration
│   └── variables.tf          # Module input variables
├── main.tf                   # Module call for specific environment
├── providers.tf              # AWS provider configuration
├── terraform.tf              # Optional backend config (e.g., remote state)
├── terraform.tfstate         # Current state file (should not be committed)
├── terraform.tfstate.backup  # Backup state file (auto-generated)
├── teraa-key                 # EC2 private key (DO NOT COMMIT)
└── teraa-key.pub             # EC2 public key

```

----------

## 🚀 Features

-   ✅ Modular and reusable infrastructure setup
    
-   ✅ Multi-environment support (`dev`, `staging`, `prod`)
    
-   ✅ Dynamic resource configuration via `variables.tf`
    
-   ✅ EC2 instance provisioning with custom AMI, type, and count
    
-   ✅ S3 bucket creation for storage
    
-   ✅ DynamoDB table setup with user-defined hash key
    
-   ✅ Secure key-pair support for EC2 access
    

----------

## 🧱 How It Works

-   **Module (`infra-eks-app`)**: Defines the core infrastructure logic (EC2, S3, DynamoDB)
    
-   **main.tf**: Instantiates the module with environment-specific values
    
-   **variables.tf**: Exposes inputs for customization
    
-   **providers.tf**: Connects to AWS with a specified region and credentials
    

----------

## ⚙️ Usage

### 1️⃣ Initialize the Terraform project

```bash
terraform init

```

Initializes the working directory, downloads the module, and configures the backend.

----------

### 2️⃣ Review planned changes

```bash
terraform plan

```

Outputs the execution plan to understand what will be created or modified.

----------

### 3️⃣ Apply the configuration

```bash
terraform apply

```

Creates the infrastructure on AWS after confirmation.

----------

### 4️⃣ Destroy the infrastructure

```bash
terraform destroy

```

Deletes all resources defined in the configuration.

----------

## 📦 Module Usage Example

Here’s how the module is called in `main.tf`:

```hcl
module "dev-infra" {
  source         = "./infra-eks-app"
  env            = "dev"
  bucket_name    = "tws-infra-app-bucket"
  instance_count = 1
  instance_type  = "t2.micro"
  ec2_ami_id     = "ami-020cba7c55df1f615"
  hash_key       = "studentID"
}

```

You can replicate this for different environments by changing values and using separate workspaces or folders.

----------

## 📌 Best Practices

-   🔒 **Do not commit sensitive files** like:
    
    ```
    teraa-key
    terraform.tfstate
    terraform.tfstate.backup
    .terraform/
    
    ```
    
-   ☁️ **Use remote backends** (like S3 + DynamoDB) to manage state securely and support team collaboration.
    
-   🧪 **Test in `dev`** before applying changes in `staging` or `prod`.
    
-   📁 Use **workspace separation** or folder-based structure for environment isolation.
    

----------

## 🔒 Security Tips

-   **Private keys (`teraa-key`) should NEVER be pushed to GitHub**
    
-   Consider rotating EC2 key-pairs regularly
    
-   Use IAM roles with least privilege access
    

----------

## 📄 License

This project is licensed under the [MIT License](https://chatgpt.com/c/LICENSE). Feel free to use and adapt it for your infrastructure needs.

----------
