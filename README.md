# AWS VPC Infrastructure with Terraform & CI/CD using GitHub Actions
This project provisions a Virtual Private Cloud (VPC) on AWS using Terraform, with an integrated CI/CD pipeline powered by GitHub Actions for automated infrastructure deployment.

# Tech Stack
- Terraform – Infrastructure as Code (IaC) to define and provision AWS VPC resources
- AWS – Cloud provider for hosting infrastructure
- GitHub Actions – CI/CD pipeline for automated plan and apply stages

# Features
Fully automated creation of:
- Custom VPC
- Subnets
- Route Tables
- Internet Gateway

GitHub Actions for:
- Terraform formatting and validation
- Terraform plan, apply and destroy on push request to main
