resource "tailscale_tailnet_key" "pve" {
  reusable      = true
  ephemeral     = false
  preauthorized = true
  expiry        = 7776000 # 90 days
  description   = "proxmox-ve-${var.ve_node_name}"
}