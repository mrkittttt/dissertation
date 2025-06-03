# provider.tf variables
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


# main.tf variables
variable "target_node" {
  type = string
  description = "Node name of a Proxmox host"
}

variable "ssh_keys" {
  type = string
  description = "SSH public key for authentication"
}

variable "storage" {
  type = string
  description = "Name of the storage in Proxmox"
  default = "local-lvm"
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

variable "nodes" {
  type = list(object({
    hostname = string
    ip = string
    gw = string
    ciuser = string
  }))
  description = "List of objects over which for_each iterates. Object has unique values for each VM"
}
