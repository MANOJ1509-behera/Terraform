# Terraform State Management Project

This project demonstrates how Terraform manages state using **S3 backend and DynamoDB locking** on AWS.

---

## 🖼️ Architecture Overview

![Image 2](https://raw.githubusercontent.com/MANOJ1509-behera/Terraform/main/Terraform-state/Images/img-2.png)


**Description:**
This diagram shows the basic Terraform workflow where configuration files are used to create infrastructure resources in AWS.

---

## 🗂️ Remote State Storage (S3 Bucket)

![Image 1](https://raw.githubusercontent.com/MANOJ1509-behera/Terraform/main/Terraform-state/Images/img.png)


**Description:**
Terraform state file is stored in an S3 bucket to ensure centralized and shared state management across multiple users.

---

## 🔒 State Locking with DynamoDB

![Image 3](https://raw.githubusercontent.com/MANOJ1509-behera/Terraform/main/Terraform-state/Images/img-3.png)

**Description:**
DynamoDB is used for state locking to prevent multiple users from modifying infrastructure at the same time, avoiding state corruption.

---

## 🔁 Terraform Workflow with Backend

![Image 4](https://raw.githubusercontent.com/MANOJ1509-behera/Terraform/main/Terraform-state/Images/img-4.png)

**Description:**
This shows the complete workflow where Terraform interacts with S3 for state storage and DynamoDB for locking during `terraform apply`.

---

## 🚀 Key Features

- Remote state storage using AWS S3
- State locking using DynamoDB
- Version-controlled infrastructure state
- Safe collaboration for teams

---

## ⚙️ Backend Configuration Example

```hcl
terraform {
  backend "s3" {
    bucket         = "terraform-up-and-running-state"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }
}
