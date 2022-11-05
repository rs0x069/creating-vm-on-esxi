provider "esxi" {
  esxi_hostname = var.esxi_hostname
  esxi_hostport = var.esxi_hostport
  esxi_hostssl  = var.esxi_hostssl
  esxi_username = var.esxi_username
  esxi_password = var.esxi_password
}

resource "esxi_guest" "instance" {
  count = var.count_of_servers
  
  guest_name = "${var.guest_name}-${count.index + 1}"

  ovf_source = var.ovf_source
  power      = "on"
  virthwver  = 15
  guestos    = "debian10-64"

  numvcpus       = var.numvcpus
  memsize        = var.memsize
  disk_store     = var.disk_store
  boot_disk_type = var.boot_disk_type
  boot_disk_size = var.boot_disk_size

  # ovf_properties {
  #   key   = "hostname"
  #   value = "${var.guest_name}-${count.index + 1}"
  # }

  network_interfaces {
    virtual_network = var.virtual_network
  }
}
