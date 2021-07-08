variable "vsphere-server" {
    type = string
}

variable "vsphere-user" {
    description = "vcenter login username"
}

variable "vsphere-password" {
    description = "vcenter password"
    sensitive = true
}

variable "vsphere-datacenter" {
    description = "vcenter datacenter name"
}

variable "vsphere-host" {
    description = "host in a vcenter datacenter"
}

variable "vsphere-network" {
    description = "name of a vsphere network"
}

variable "vsphere-datastore" {
    description = "vsphere datastore"
}

variable "vm-name" {
    description = "VM template name"
}

variable "vm-guest-id" {
    description = "VM guest id"
}

variable "vm-cpu-num" {
    description = "VM CPUs"
}

variable "vm-mem-size" {
    description = "VM memory size"
}

variable "vm-disk-size" {
    description = "VM disk size"
}

variable "iso-paths" {
    description = "List of ISO paths"
    type = list(string)
}

variable "ssh-username" {
    description = "SSH user"
    type = string
}

variable "ssh-password" {
    description = "SSH user password"
    type = string
    sensitive = true
}