# TODO not working yet
source "vsphere-iso" "basic-example" {
    vcenter_server    = var.vsphere_server
    username          = var.vsphere_user
    password          = var.vsphere_password
    datacenter        = var.datacenter
    #cluster           = var.cluster
    datastore = var.datastore

    host = var.host
    
    insecure_connection  = true

    iso_url = "https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-10.10.0-amd64-netinst.iso"
    iso_checksum = "md5:c7d0e562e589e853b5d00563b4311720"
    ssh_username = "packer"
    ssh_password = "packer"
    shutdown_command = "shutdown -P now"

    CPUs =             1
    RAM =              1024
    RAM_reserve_all = true

    vm_name = "test-debian"
    guest_os_type = "otherLinux64Guest"

    storage {
        disk_size =        16000
        disk_thin_provisioned = true
    }

    network_adapters {
        network =  var.network_name
        network_card = "vmxnet3"
    }

    http_directory= "http"
    boot_command = [
        "<esc><wait>",
        "install <wait>",
        " preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed.cfg <wait>",
        "debian-installer=en_US.UTF-8 <wait>",
        "auto <wait>",
        "locale=en_US.UTF-8 <wait>",
        "kbd-chooser/method=us <wait>",
        "keyboard-configuration/xkb-keymap=us <wait>",
        "netcfg/get_hostname={{ .Name }} <wait>",
        "netcfg/get_domain=vagrantup.com <wait>",
        "fb=false <wait>",
        "debconf/frontend=noninteractive <wait>",
        "console-setup/ask_detect=false <wait>",
        "console-keymaps-at/keymap=us <wait>",
        "grub-installer/bootdev=/dev/sda <wait>",
        "<enter><wait>"
    ]
}

build {  
    sources = ["sources.vsphere-iso.basic-example"]

    provisioner "shell-local" {
        inline  = ["echo the address is: $PACKER_HTTP_ADDR and build name is: $PACKER_BUILD_NAME"]
    }
}