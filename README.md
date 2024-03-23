# Application : CHALLENGE1 - 3-TIER Application

## Terraform Project Overview
This Terraform project aims to manage infrastructure as code using modules and root calling syntax. The project is organized to enhance code reusability and scalability.

## Modules Folder Structure
The project follows a structured folder hierarchy:

main.tf: Contains reusable modules for managing specific infrastructure components.
variables.tf: Defines input variables for the Terraform configuration.
outputs.tf: Specifies output values to be shown after applying the Terraform configuration.
version.tf : specifies the terraform version and azurerm version.

## Root Calling Syntax
The root calling syntax in Terraform refers to how root modules are used to call child modules and orchestrate the infrastructure. The root module serves as the entry point for the Terraform configuration and coordinates the use of various modules.

main.tf: Contains the main configuration for the module.
variables.tf: second layer of variables specific to the module if needed.
outputs.tf: Defines output values to be returned from the module.
Provider.tf: mentioned with azurerm provider.


## IaC Details

| Azure Resource             | Count | Resource Description |
|----------------------------|-------|--------------------- |
| App service plan           |   1   | The application Main App Plan for Web service|
| Web App                    |   1   | The application Main Web App|
| Private Endpoint           |   1   | The application Main Private Endpoint for web app|
| Vnet Intergation           |   1   | The application Main Vnet for web app|
| App Insight                |   1   | The application Main App insight for web app|
| MSSQL                      |   1   | The application Main sql data base|
| Private Endpoint           |   1   | The application Main Private Endpoint for sql data base|
| Subnets                    |   2   | The application Main subnets for VNet, PE|
| Keyvault                   |   1   | The application Main Keyvault for storing the secrets |
| Private Endpoint           |   1   | The application Main Private endpoint for the keyvault |
| Storage account            |   1   | The application Main Storage Account  |
| Private Endpoint           |   1   | The application Main Private Endpoint for storage account|
| VNET                       |   1   | The application Main VNET for address space|
| Resource Group             |   1   | The application Main Resource Group|


### To deploy resources 
-Install Azure CLI:
Ensure that you have the Azure CLI installed on your machine. You can download and install it from the official Azure CLI documentation: Install Azure CLI.

Authenticate to Azure:
Log in to your Azure account using the Azure CLI. Run the following command and follow the prompts to authenticate: az login

Create a Terraform Configuration:
Create a new directory for your Terraform configuration and navigate to it in your terminal. Initialize a new Terraform configuration:
cd root-module
terraform init

Run Terraform Commands:
Use Terraform commands to plan and apply your configuration. Run terraform plan to see the execution plan and verify the changes that Terraform will make:
terraform plan

If the plan looks good, apply the changes using terraform apply: terraform apply

Clean Up Resources (Optional):
If you want to remove the resources created by Terraform, you can use the terraform destroy command:terraform destroy

Exit Azure CLI Session:
After completing your tasks, you can exit the Azure CLI session:az logout
