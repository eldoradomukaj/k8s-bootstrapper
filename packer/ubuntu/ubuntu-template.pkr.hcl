
source "vsphere-iso" "ubuntu-kube-template" {
  CPUs                 = var.vm-cpu-num
  RAM                  = var.vm-mem-size
  RAM_reserve_all      = false
  boot_command         = ["<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<wait><esc><wait><f6><wait><esc><wait>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>", "<bs><bs><bs>", "/casper/vmlinuz ", "initrd=/casper/initrd ", " ipv6.disable=1 autoinstall ", "ds=nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/", "<enter>"]
  boot_wait            = "5s"
  convert_to_template  = true
  datacenter           = var.vsphere-datacenter
  datastore            = var.vsphere-datastore
  disk_controller_type = ["pvscsi"]
  guest_os_type        = var.vm-guest-id
  host                 = var.vsphere-host
  http_directory       = "http"
  insecure_connection  = "true"
  iso_paths            = var.iso-paths

  network_adapters {
    network      = var.vsphere-network
    network_card = "vmxnet3"
  }

  password     = var.vsphere-password
  ssh_password = var.ssh-password
  ssh_timeout  = "20m"
  ssh_username = var.ssh-username

  storage {
    disk_size             = var.vm-disk-size
    disk_thin_provisioned = true
  }
  
  username       = var.vsphere-user
  vcenter_server = var.vsphere-server
  vm_name        = var.vm-name
  folder         = "Templates"
}

build {
  sources = ["source.vsphere-iso.ubuntu-kube-template"]

  provisioner "shell" {
    script = "./setup.sh"
  }

}
