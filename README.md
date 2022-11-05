# Automatic creation of virtual machines in ESXi

Creating virtual machines on ESXi using Packer and Terraform. 
Packer creates machine images, Terraform deploys images to ESXi.\
Terraform uses provider [terraform-provider-esxi](https://github.com/josenk/terraform-provider-esxi) to deploy on ESXi.


## Requirements
* Packer - creating machine images
* Virtual Box and/or [VMWare Workstation](https://www.vmware.com/go/getworkstation-linux) - platform for creating machine images (VMWare Workstation contains ovftool)
* [ovftool](https://customerconnect.vmware.com/downloads/get-download?downloadGroup=OVFTOOL443) from VMware - converting VMX to OVA
* Terraform - deploying to ESXi

## Pre-settings
* ssh access on your ESXi hypervisor must be enabled

## Configuration

### Packer variables

 Variable            | Default Value       | Description
---------------------|---------------------|---------------------------------------
 `vm_name`           | debian-11.5.0-amd64 | 
 `guest_os_type`     | debian10-64         | 
 `cpus`              | 1                   | Count of CPU
 `memory_mb`         | 1024                | Memory
 `disk_size_mb`      | 5120                | Disk size
 `ssh_username`      | root                | OS username
 `ssh_password`      | Passw0rd            | OS password. You can change default password by using `mkpasswd -m sha-512 <password>` and setting this in fie `http/preseed-debian11.cfg` on line `d-i passwd/root-password-crypted password`
 `hostname`          | packer-localhost    | Hostname
 `iso_url`           | `https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-11.5.0-amd64-netinst.iso` | `file:/full/path/to/iso/filename.iso`
 `iso_checksum`      | e307d0e583b4a8f7e5b436f8413d4707dd4242b70aea61eb08591dc0378522f3 | Checksum of iso file
 `iso_checksum_type` | sha256              | Type of checksum
 `boot_wait`         | 5s                  | 

### Terraform variables

 Variable            | Default Value       | Description
---------------------|---------------------|---------------------------------------


## Usage
Clone the repository:
```bash
git clone https://github.com/rs0x069/creating-vm-on-esxi && cd creating-vm-on-esxi
```

1. Build a machine image

Build a machine image using VMWare
```bash
packer build -only=vmware-iso debian-11.5-amd64.json
```

Build a machine image using VirtualBox
```bash
packer build -only=virtualbox-iso debian-11.5-amd64.json
```

2. Deploy the machine image to ESXi
```bash
terraform -chdir=./terraform init
terraform -chdir=./terraform apply  # Type yes
```

3. Delete the VM from ESXi
```bash
terraform -chdir=./terraform destroy  # Type yes
```

## Connect to VMs
Default username is `root` with password `Passw0rd`

## Prepared machine images
[debian-11.5.0-amd64.ova](https://drive.google.com/file/d/19nkarU8Gq2UAcTP-RRKzxjEIGojWugpu/view?usp=sharing)
