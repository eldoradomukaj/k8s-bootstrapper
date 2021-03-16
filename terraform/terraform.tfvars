#vsphere config
vsphere_user = ""
vsphere_server = ""
vsphere_unverified_ssl = true
vsphere_datacenter = "" 
vm_resource_pool = ""

#VM config
vm_network = ""
vm_10Gb_network = ""
vm_template = ""
vm_firmware = "efi"
vm_count = 3
vm_name = ""
vm_datastore = ""
vm_cpu = 4
vm_cpu_cores_per_socket = 4
vm_ram = 4096
vm_disk_size = 100
vm_thin_provision = "true"
vm_domain = ""

vm_10gb_ips_ctrl = ["172.20.0.10", "172.20.0.11", "172.20.0.12"]
vm_10gb_ips_wrkr = ["172.20.0.20", "172.20.0.21", "172.20.0.22"]