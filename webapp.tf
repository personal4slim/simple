name: Terraform Deployment

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Set up Terraform
        uses: hashicorp/setup-terraform@v1
        with:
          terraform_version: '1.0.4'  # Specify the desired Terraform version

      - name: Configure Terraform workspace
        run: terraform init

      - name: Login to Azure
        uses: azure/login@v1
        with:
          creds: ${{ secrets.AZURE_CREDENTIALS }}  # Store your Azure credentials as a secret

      - name: Deploy using Terraform
        run: terraform apply -auto-approve

      - name: Clean up
        run: terraform destroy -auto-approve
