module "network" {
  source = "./modules/network"

  tenancy_ocid      = var.tenancy_ocid
  vcn_cidr          = var.vcn_cidr
  subnet_cidr       = var.subnet_cidr
  access_ip_address = var.access_ip_address
}

module "compute" {
  source = "./modules/compute/"

  vm_ssh_key          = file(var.ssh_key_path)
  private_ip_id       = data.oci_core_private_ips.vm_private_ips.private_ips[0].id
  vm_image            = data.oci_core_images.oracle_linux.images[0].id
  tenancy_ocid        = var.tenancy_ocid
  subnet_ocid         = module.network.vcn_subnet_id
  availability_domain = data.oci_identity_availability_domains.availability_domains.availability_domains[0].name
}
