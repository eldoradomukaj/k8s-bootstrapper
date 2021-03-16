provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server

  allow_unverified_ssl = var.vsphere_unverified_ssl
}

data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter
}

data "vsphere_datastore" "datastore" {
  name          = var.vm_datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
  name          = var.vm_resource_pool
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.vm_network
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "vm_10gb_network" {
  name          = var.vm_10Gb_network
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.vm_template
  datacenter_id = data.vsphere_datacenter.dc.id
}


resource "vsphere_virtual_machine" "control-plane" {
  count            = var.vm_count
  name             = "${var.vm_name}-ctrl-${count.index + 1}"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id
  firmware         = var.vm_firmware

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  network_interface {
    network_id = data.vsphere_network.vm_10gb_network.id
  }

  num_cpus             = var.vm_cpu
  num_cores_per_socket = var.vm_cpu_cores_per_socket
  memory               = var.vm_ram
  guest_id             = data.vsphere_virtual_machine.template.guest_id

  disk {
    label            = "${var.vm_name}-ctrl-${count.index + 1}.vmdk"
    size             = var.vm_disk_size
    thin_provisioned = var.vm_thin_provision
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    linked_clone  = false

    customize {

      linux_options {
        host_name = "${var.vm_name}-ctrl-${count.index + 1}"
        domain    = var.vm_domain
      }

      network_interface {}

      network_interface {
        ipv4_address = var.vm_10gb_ips_ctrl[count.index]
        ipv4_netmask = 24
      }

    }
  }
}

resource "vsphere_virtual_machine" "worker" {
  count            = var.vm_count
  name             = "${var.vm_name}-wrkr-${count.index + 1}"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id
  firmware         = var.vm_firmware

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  network_interface {
    network_id = data.vsphere_network.vm_10gb_network.id
  }

  num_cpus             = var.vm_cpu
  num_cores_per_socket = var.vm_cpu_cores_per_socket
  memory               = var.vm_ram
  guest_id             = data.vsphere_virtual_machine.template.guest_id

  disk {
    label            = "${var.vm_name}-wrkr-${count.index + 1}.vmdk"
    size             = var.vm_disk_size
    thin_provisioned = var.vm_thin_provision
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    linked_clone  = false

    customize {

      linux_options {
        host_name = "${var.vm_name}-wrkr-${count.index + 1}"
        domain    = var.vm_domain
      }

      network_interface {}

      network_interface {
        ipv4_address = var.vm_10gb_ips_wrkr[count.index]
        ipv4_netmask = 24
      }

    }
  }
}
