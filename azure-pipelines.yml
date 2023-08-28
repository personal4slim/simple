trigger:
- main

pr:
- '*'

jobs:
- job: Terraform
  pool:
    vmImage: 'ubuntu-latest'

  steps:
  - script: |
      terraform init
      terraform plan -out=tfplan
    displayName: 'Terraform Plan'
    displayName: 'Terraform Plan'
  
  - script: |
      terraform apply tfplan
    displayName: 'Terraform Apply'
    condition: and(succeeded(), ne(variables['Build.Reason'], 'PullRequest'))
