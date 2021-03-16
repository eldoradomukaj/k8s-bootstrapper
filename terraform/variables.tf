variable "vsphere_unverified_ssl" {
  description = "allow unverified ssl"
}

variable "vsphere_user" {
  description = "vcenter login username"
  type        = string
  sensitive   = true
}

variable "vsphere_password" {
  description = "vsphere password"
  type        = string
  sensitive   = true
}

variable "vsphere_server" {
  description = "vsphere server IP"
  type        = string
  sensitive   = true
}

variable "vsphere_datacenter" {
  description = "vsphere datacenter"
}

variable "vm_resource_pool" {
  description = "vm resource pool"
}

variable "vm_datastore" {
  description = "vm datastore"
}
variable "vm_network" {
  description = "vm network"
}

variable "vm_10Gb_network" {
  description = "10Gb network"
}

variable "vm_template" {
  description = "vm template"
}

variable "vm_name" {
  description = "vm name"
}

variable "vm_count" {
  description = "vm count"
}

variable "vm_cpu" {
  description = "vm cpu"
}

variable "vm_cpu_cores_per_socket" {
  description = "cores per socket"
}

variable "vm_ram" {
  description = "vm ram"
}

variable "vm_disk_size" {
  description = "disk size in GB"
}

variable "vm_thin_provision" {
  description = "thin provision disk"
  default     = "true"
}

variable "vm_domain" {
  description = "vm  domain"
}

variable "vm_firmware" {
  description = "set to bios or efi"
}
variable "vm_10gb_ips_ctrl" {
  description = "10gb IP control-plane nodes"
  type        = list(string)
}

variable "vm_10gb_ips_wrkr" {
  description = "10gb IP worker nodes"
  type        = list(string)
}
