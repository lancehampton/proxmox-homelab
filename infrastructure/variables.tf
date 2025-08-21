##############
# Proxmox VE #
##############

variable "ve_endpoint" {
  description = "The endpoint for the Proxmox Virtual Environment API (example: https://host:port)"
  type        = string
}

variable "ve_username" {
  description = "Proxmox User for API Access"
  type        = string
  default     = "root@pam"
}

variable "ve_password" {
  description = "Password for Proxmox API User"
  type        = string
  sensitive   = true
  default     = "do not use default passwords!"
}

variable "ve_node_name" {
  description = "Name of the Proxmox node"
  type        = string
  default     = "pve"
}


#############
# Tailscale #
#############

variable "ts_api_key" {
  description = "API Key for Tailscale"
  type        = string
  sensitive   = true
}

variable "ts_tailnet" {
  description = "Tailscale Tailnet name"
  type        = string
}

##############
# Cloudflare #
##############
