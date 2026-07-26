resource "oci_core_instance" "this" {
  compartment_id      = var.tenancy_ocid
  availability_domain = var.availability_domain

  shape = var.shape

  shape_config {
    ocpus         = var.vm_cpu
    memory_in_gbs = var.vm_memory
  }

  source_details {
    source_type             = "image"
    source_id               = var.vm_image
    boot_volume_size_in_gbs = var.vm_storage
  }

  create_vnic_details {
    subnet_id        = var.subnet_ocid
    assign_public_ip = false
    display_name     = "${var.prefix}-vnic"
    hostname_label   = "${var.prefix}vnic"

    freeform_tags = merge(var.tags, {
      Name = "${var.prefix}-vnic"
    })
  }

  metadata = {
    ssh_authorized_keys = var.vm_ssh_key
  }

  freeform_tags = merge(var.tags, {
    Name = "${var.prefix}-instance"
  })
}

resource "oci_core_public_ip" "this" {
  compartment_id = var.tenancy_ocid
  display_name   = "${var.prefix}-static-ip"

  lifetime = "RESERVED"

  private_ip_id = var.private_ip_id

  freeform_tags = merge(var.tags, {
    Name = "${var.prefix}-static-ip"
  })
}
