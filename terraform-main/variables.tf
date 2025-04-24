variable "location" {
  description = "The Azure region to deploy resources in"
  type        = string
  default     = "East US"
}

variable "admin_username" {
  description = "Username for the Linux virtual machine"
  type        = string
  default     = "adminuser"
}

variable "ssh_key_path" {
  description = "Path to your public SSH key"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}
