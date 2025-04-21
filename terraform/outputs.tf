output "resource_group_name" {
  value = azurerm_resource_group.jenkins-rg.name
  description = "The name of the resource group"
}

output "virtual_network_name" {
  value = azurerm_virtual_network.jenkins-vn.name
  description = "The name of the virtual network"
}

output "subnet_name" {
  value = azurerm_subnet.jenkins-subnet.name
  description = "The name of the subnet"
}

output "network_interface_id" {
  value = azurerm_network_interface.example.id
  description = "The ID of the network interface"
}

output "public_ip_address" {
  value       = azurerm_public_ip.jenkins-public-ip.ip_address
  description = "The public IP address of the Jenkins VM"
}

output "virtual_machine_name" {
  value = azurerm_linux_virtual_machine.jenkins-VM.name
  description = "The name of the Jenkins VM"
}

output "admin_username" {
  value = azurerm_linux_virtual_machine.jenkins-VM.admin_username
  description = "Admin username for the Jenkins VM"
}
