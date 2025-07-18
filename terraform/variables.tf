### PROVIDER.TF VARIABLES ###
variable "proxmox_url" {
  type = string
  description = "Domain name or IP address of a Proxmox host"
}

variable "token_id" {
  type = string
  sensitive = true
}

variable "token_secret" {
  type = string
  sensitive = true
}


### MAIN.TF VARIABLES ###
variable "target_node" {
  type = string
  description = "Node name of a Proxmox host"
}

variable "ssh_keys" {
  type = string
  description = "SSH public key for authentication"
}

variable "storage_name" {
  type = string
  description = "Name of the storage in Proxmox"
  default = "local-lvm"
}

variable "storage_size" {
  type = string
  description = "Size of storage in GB"
}

variable "vm_template" {
  type = string
  description = "Name of VM template from which Terraform will deploy instances"
}

variable "cores" {
  type = string
  description = "Number of cores for a VM"
}

variable "memory" {
  type = string
  description = "RAM size for a VM"
}

variable "gw" {
  type = string
  description = "Default gateway ip address"
}

variable "ciuser" {
  type = string
  description = "username for cloudinit setup"
}

variable "nodes" {
  type = list(object({
    hostname = string
    ip = string
    cores = string
    memory = string
    storage_size = string
  }))
  description = "List of objects over which for_each iterates. An Object has unique values for each VM"
}

variable "vault_server" {
  type = string
  description = "IP address of Vault server"
}

variable "vault_token" {
  type = string
  description = "Service token to allow Terraform read secrets from Vault"
}
