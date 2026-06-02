# AWS Infrastructure Automation

## Overview

This project demonstrates Infrastructure as Code (IaC) using Terraform to provision AWS infrastructure automatically.

## Technologies Used

* AWS
* Terraform
* Git
* Linux
* Apache Web Server

## Infrastructure Components

* VPC
* Public Subnet
* Internet Gateway
* Route Table
* Route Table Association
* Security Group
* EC2 Instance
* SSH Key Pair

## Features

* Automated infrastructure provisioning using Terraform
* Automated Apache installation using user_data
* SSH access using AWS Key Pair
* Public web server deployment

## Deployment Steps

```bash
terraform init
terraform plan
terraform apply
```

## Cleanup

```bash
terraform destroy
```

## Future Enhancements

* Terraform Modules
* S3 Remote Backend
* DynamoDB State Locking
* Python Automation with Boto3
* GitHub Actions CI/CD
* Private Subnets and NAT Gateway

```
```
