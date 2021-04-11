variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "us-west-1"
}

variable "public_key" {
  description = "public ssh key for instances"
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCu4si6/RT8kczzQPuuqmsBgfvHYFIyo42W5AZVpTv5rGfhwrKj5uO3Hn0nUhcHOmCE5oe3hGTv0xL85ufkbUul4hcrtQgXOuFrZWcXQx5iqUsO0UDHvSH0XLPsRR7JHfwG+XVB8JqqMacIpC3KWEOZiUA8D2CFm6Q0GyHK07DDf98phAbDGRc4SpWYpWIdFov0X/RjUiM7uZZBzH3vizm8/PJVh753i6RpueHUkK1iXPb+6TmXKHpFUE8SDqx37CfXoVI6xwf47uooqJPlVAm4L/JqDScwMZkfX741LHre5UzZUoGZKnZ8C6TmhCMisXpNQrSjjDgCgxL4pA4vaBzR pi@raspberrypi"
}

# variable "linode_token" {
#   description = "linode.com API token"
# }

variable "namecheap_key" {
  description = "namecheap.com api key"
}

variable "home_ip" {
  description = "homelab IP"
}

variable "farmlife_ip" {
  description = "backup server IP"
}

variable "mjolnir_password" {
  description = "Proxmox Mjolnir Password"
}

variable "king_password" {
  description = "Proxmox King Password"
}
