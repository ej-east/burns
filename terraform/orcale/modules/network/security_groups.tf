resource "oci_core_security_list" "sec_list_public" {
  compartment_id = var.tenancy_ocid
  vcn_id         = oci_core_vcn.this.id

  display_name = "${var.prefix}-sec_list_public"

  # Allow all traffic out of the VM
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "all"
    stateless   = false
  }

  # Allow the engineer access to the machine 
  ingress_security_rules {
    source   = "${var.access_ip_address}/32"
    protocol = "6" #TCP Code 

    tcp_options {
      min = 22
      max = 22
    }

    stateless = false
  }

  # Allow HTTP / HTTPS  
  dynamic "ingress_security_rules" {
    for_each = toset([80, 443])

    content {
      source    = "0.0.0.0/0"
      protocol  = "6"
      stateless = false

      tcp_options {
        min = ingress_security_rules.value
        max = ingress_security_rules.value
      }
    }
  }

  # Allow wireguard traffic
  ingress_security_rules {
    source   = "0.0.0.0/0"
    protocol = "17" # UDP Code 

    udp_options {
      min = 51820
      max = 51820
    }

    stateless = false
  }

  freeform_tags = merge(var.tags, {
    Name = "${var.prefix}-sec_list_public"
  })
}
