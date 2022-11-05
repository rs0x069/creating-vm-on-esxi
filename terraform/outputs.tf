output "boot_disk_size" {
  value = esxi_guest.instance[*].boot_disk_size
}

output "ovf_properties" {
  value = esxi_guest.instance[*].ovf_properties
}
