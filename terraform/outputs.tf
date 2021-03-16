#output to ansible inventory file

resource "local_file" "AnsibleInventory" {
  content = templatefile("inventory.tmpl",
    {
      ctrl_names = vsphere_virtual_machine.control-plane.*.name
      ctrl_ips   = vsphere_virtual_machine.control-plane.*.default_ip_address

      wrkr_names = vsphere_virtual_machine.worker.*.name
      wrkr_ips   = vsphere_virtual_machine.worker.*.default_ip_address
    }
  )
  filename = "../ansible/inventory.ini"
}
