variable "vsphere_server" {
  type        = string
  description = "vSphere / vCenter IP or FQDN"
  default     = "192.168.5.101"
}

variable "vsphere_user" {
  type        = string
  description = "vSphere username"
  default     = "Study3-devops@vsphere.local"
}

variable "vsphere_password" {
  type        = string
  description = "vSphere user password"
  sensitive   = true
}

variable "vsphere_allow_unverified_ssl" {
  type        = bool
  description = "Allow unverified SSL certificates"
  default     = true
}

variable "vsphere_datacenter" {
  type        = string
  description = "Target Datacenter name"
  default     = "Datacenter"
}

variable "vsphere_datastore" {
  type        = string
  description = "Target Datastore name"
  default     = "Toshiba_2TB"
}

variable "vsphere_host" {
  type        = string
  description = "ESXi host IP/FQDN"
  default     = "192.168.5.100"
}

variable "vsphere_network" {
  type        = string
  description = "Target VM Network name"
  default     = "VM Network"
}

variable "template_name" {
  type        = string
  description = "VM template name to clone"
  default     = "ubuntu_24.04.3"
}

variable "vm_name" {
  type        = string
  description = "Virtual Machine name"
  default     = "Study3-k8s-setup"
}

variable "vm_folder" {
  type        = string
  description = "VM folder in vCenter"
  default     = "Students-VMs"
}

variable "vm_cpus" {
  type        = number
  description = "Number of CPU cores (max 2 per requirements)"
  default     = 1
}

variable "vm_memory" {
  type        = number
  description = "RAM in MB (max 2048 MB per requirements)"
  default     = 1024
}

variable "vm_ip" {
  type        = string
  description = "Static IP address for the VM"
  default     = "192.168.5.203"
}

variable "vm_netmask" {
  type        = number
  description = "Subnet mask CIDR"
  default     = 24
}

variable "vm_gateway" {
  type        = string
  description = "Default gateway"
  default     = "192.168.5.1"
}

variable "vm_dns" {
  type        = list(string)
  description = "DNS servers"
  default     = ["192.168.5.1", "8.8.8.8"]
}

variable "vm_domain" {
  type        = string
  description = "Domain name for customization"
  default     = "local.lan"
}

variable "ssh_public_key" {
  type        = string
  description = "Public SSH key to inject into authorized_keys"
  default     = ""
}


