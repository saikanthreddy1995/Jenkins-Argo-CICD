output "resource_group_name" {
  value = module.resource_group.name
}

output "virtual_network_name" {
  value = module.network.vnet_name
}

output "subnet_name" {
  value = module.network.subnet_name
}

output "public_ip_address" {
  value = module.network.public_ip
}

output "vm_name" {
  value = module.virtual_machine.vm_name
}
