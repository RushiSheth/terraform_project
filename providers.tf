terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.46.0"
    }
  }
  required_version = "~> 0.14"
}

provider "azurerm" {
  features {}
}

locals {
  common_tags = {
    Name         = "Terraform-Ansible Group-9 Project "
    GroupMembers = "Rushi-Kunj"
    ExpirationDate = "2021-08-19"
    Environment  = "Lab"
  }
}
