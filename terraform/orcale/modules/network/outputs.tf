output "vcn_id" {
  description = "VCN OCID"
  value       = oci_core_vcn.this.id
}

output "vcn_subnet_id" {
  description = "VCN Subnet OCID"
  value       = oci_core_subnet.this.id
}

output "vcn_route_table_id" {
  description = "VCN Route table OCID"
  value       = oci_core_route_table.this.id
}

output "vcn_internet_gateway_id" {
  description = "VCN Internet Gateway OCID"
  value       = oci_core_internet_gateway.this.id
}
