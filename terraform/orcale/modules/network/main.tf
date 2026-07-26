resource "oci_core_vcn" "this" {
  compartment_id = var.tenancy_ocid
  cidr_block     = var.vcn_cidr

  display_name = "${var.prefix}-vcn"
  dns_label    = "${var.prefix}vcn"

  freeform_tags = merge(var.tags, {
    Name = "${var.prefix}-vcn"
  })
}

resource "oci_core_internet_gateway" "this" {
  compartment_id = var.tenancy_ocid
  vcn_id         = oci_core_vcn.this.id

  display_name = "${var.prefix}-igw"
  enabled      = true

  freeform_tags = merge(var.tags, {
    Name = "${var.prefix}-igw"
  })
}

resource "oci_core_route_table" "this" {
  compartment_id = var.tenancy_ocid
  vcn_id         = oci_core_vcn.this.id

  display_name = "${var.prefix}-rt"

  route_rules {
    network_entity_id = oci_core_internet_gateway.this.id
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    description       = "Allow traffic"
  }

  freeform_tags = merge(var.tags, {
    Name = "${var.prefix}-rt"
  })
}

# public subnet
resource "oci_core_subnet" "this" {
  compartment_id = var.tenancy_ocid
  vcn_id         = oci_core_vcn.this.id

  cidr_block                 = var.subnet_cidr
  prohibit_public_ip_on_vnic = false

  display_name = "${var.prefix}-vcn-public-subnet"
  dns_label    = "${var.prefix}publicsub"

  route_table_id    = oci_core_route_table.this.id
  security_list_ids = [oci_core_security_list.sec_list_public.id]

  freeform_tags = merge(var.tags, {
    Name = "${var.prefix}-vcn-public-subnet"
  })
}
