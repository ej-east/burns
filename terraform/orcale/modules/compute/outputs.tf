output "vm_id" {
  description = "VM OCID"
  value       = oci_core_instance.this.id
}

output "vm_public_ip" {
  description = "Public IP of the VM"
  value       = oci_core_public_ip.this.ip_address
}
