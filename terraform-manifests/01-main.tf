# We will define 
# 1. Terraform Settings Block
# 1. Required Version Terraform
# 2. Required Terraform Providers
# 3. Terraform Remote State Storage with Azure Storage Account (last step of this section)
# 2. Terraform Provider Block for AzureRM
# 3. Terraform Resource Block: Define a Random Pet Resource

# 1. Terraform Settings Block
terraform {
  # 1. Required Version Terraform
  required_version = ">= 1.0"
  # 2. Required Terraform Providers  
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }

# Terraform State Storage to Azure Storage Container
  backend "azurerm" {
  }  
}



# 2. Terraform Provider Block for AzureRM
provider "azurerm" {
  subscription_id = "ab86ad4a-83cb-4d45-ba64-21eb6e8b12ea"
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

# 3. Terraform Resource Block: Define a Random Pet Resource
resource "random_pet" "aksrandom" {

}

