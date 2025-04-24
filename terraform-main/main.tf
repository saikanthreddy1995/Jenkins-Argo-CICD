terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "resource_group" {
  source  = "./modules/resource_group"
  name    = "jenkins-rg"
  location = "East US"
}

module "network" {
  source              = "./modules/network"
  rg_name             = module.resource_group.name
  location            = module.resource_group.location
  vnet_name           = "jenkins-vn"
  subnet_name         = "jenkins-subnet"
  address_space       = ["10.0.0.0/16"]
  subnet_prefixes     = ["10.0.1.0/24"]
  public_ip_name      = "jenkins-public-ip"
  nic_name            = "jenkins-nic"
}

module "security" {
  source              = "./modules/security"
  rg_name             = module.resource_group.name
  location            = module.resource_group.location
  nsg_name            = "jenkins-nsg"
  nic_id              = module.network.nic_id
}

module "virtual_machine" {
  source              = "./modules/virtual_machine"
  rg_name             = module.resource_group.name
  location            = module.resource_group.location
  nic_id              = module.network.nic_id
  vm_name             = "jenkins-vm"
  admin_username      = "adminuser"
  ssh_key_path        = "~/.ssh/id_rsa.pub"
}
