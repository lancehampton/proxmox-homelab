terraform {
  required_version = ">= 1.6.0"
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.82.1"
    }
    tailscale = {
      source  = "tailscale/tailscale"
      version = "0.21.1"
    }
  }
}

provider "proxmox" {
  endpoint = var.ve_endpoint

  username = var.ve_username
  password = var.ve_password
  insecure = true
}

provider "tailscale" {
  api_key = var.ts_api_key
  tailnet = var.ts_tailnet
}