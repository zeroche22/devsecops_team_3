output "vm_name" {
  description = "Deployed VM Name"
  value       = vsphere_virtual_machine.vm.name
}

output "vm_ip" {
  description = "Assigned static IP address"
  value       = var.vm_ip
}

output "vm_id" {
  description = "VM vSphere ID"
  value       = vsphere_virtual_machine.vm.id
}
