resource "proxmox_virtual_environment_hardware_mapping_usb" "mic" {
  name    = "Microphone"

  map = [
    {
      comment = "LavMic for Birdnet-Go"
      id      = "31b2:0022"
      node    = var.ve_node_name
    },
  ]
}