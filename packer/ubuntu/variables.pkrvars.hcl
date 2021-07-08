# vCenter info
vsphere-server      = ""
vsphere-user        = ""
vsphere-password    = ""
vsphere-datacenter  = ""
vsphere-host        = ""
vsphere-network     = ""
vsphere-datastore   = ""

# Virtual machine config
vm-name             = "ubuntu-kubeadm-template"
vm-guest-id         = "ubuntu64Guest"
vm-cpu-num          = "1"
vm-mem-size         = "1024"
vm-disk-size        = "25600"

ssh-username        = "kubeuser"
ssh-password        = "kubeuser"

iso-paths           = ["[Datastore1] ISO/ubuntu-20.04.2-live-server-amd64.iso"]