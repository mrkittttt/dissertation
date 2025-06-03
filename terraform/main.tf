resource "proxmox_vm_qemu" "nodes" {

  for_each = {for vm in var.nodes: vm.hostname => vm}

  name = each.key
  target_node = var.target_node
  clone = var.vm_template
  vm_state = "running"
  scsihw = "virtio-scsi-single"
  os_type = "cloud-init"

  # enable qemu-guest-agent
  agent = 1

  sockets = 1
  cores = var.cores
  memory = var.memory

  disks {
    ide {
      ide0 {
        cloudinit {
        storage = var.storage
       }
     }
   }

    scsi {
      scsi0 {
        disk {
          size = "20G"
          storage = var.storage
        }
      }
    }
  }


  network {
    id = 0
    model = "virtio"
    bridge = "vmbr0"
    link_down = false
  }
  

  # If a generic cloud image was used as a base, serial socket must be added
  serial {
    id = 0
    type = "socket"
  }
  

  # static IP for each VM and a default gateway
  # set to ip=dhcp if static IP is not needed
  ipconfig0="ip=${each.value.ip}/24,gw=${each.value.gw}"
  nameserver="8.8.8.8"

  ciupgrade = false  # disable auto package updating
  ciuser = each.value.ciuser
  sshkeys = var.ssh_keys
}
