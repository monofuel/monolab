provider "proxmox" {
  alias           = "mjolnir"
  pm_api_url      = "https://192.168.12.199:8006/api2/json"
  pm_user         = "root@pam"
  pm_password     = var.mjolnir_password
  pm_tls_insecure = true
}

provider "proxmox" {
  alias           = "king"
  pm_api_url      = "https://192.168.12.42:8006/api2/json"
  pm_user         = "root@pam"
  pm_password     = var.king_password
  pm_tls_insecure = true
}


# NB. not working....
# https://github.com/Telmate/terraform-provider-proxmox/issues/242

# resource "proxmox_vm_qemu" "freenas" {
#   provider    = proxmox.mjolnir
#   name        = "freenas"
#   target_node = "mjolnir"

# }
