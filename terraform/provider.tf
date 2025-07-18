terraform {
  required_version = ">=1.11.4"
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "3.0.1-rc8"
    }
    
    vault = {
      source = "hashicorp/vault"
      version = "5.1.0"
    }
  }
}


provider "proxmox" {
  pm_api_url = "https://${var.proxmox_url}:8006/api2/json"
  pm_api_token_id = var.token_id
  pm_api_token_secret = var.token_secret
  pm_tls_insecure = true
}

provider "vault" {
  address = var.vault_server
  token = var.vault_token
  skip_child_token = true
}
