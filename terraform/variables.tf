# Access to ESXi (define in terraform.tfvars)
variable "esxi_hostname" {}
variable "esxi_hostport" {}
variable "esxi_hostssl" {}
variable "esxi_username" {}
variable "esxi_password" {}

# Instance's variables
variable "count_of_servers" {
    type    = number
    default = 1
}

variable "guest_name" {
  type = string
  default = "server"
}

variable "ovf_source" {
  type    = string
  default = "../output-debian-11.5.0-amd64-vmware/debian-11.5.0-amd64.ova"
}

variable "numvcpus" {
  type    = number
  default = 1
}

variable "memsize" {
  type    = number
  default = 1024
}

variable "disk_store" {
  type    = string
  default = "HDD"
}

variable "boot_disk_type" {
  type    = string
  default = "thin"
}

variable "boot_disk_size" {
  type    = number
  default = 10
}

variable "virtual_network" {
  type    = string
  default = "VM Network"
}