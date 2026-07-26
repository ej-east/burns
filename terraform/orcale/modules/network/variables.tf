variable "prefix" {
  description = "The prefix to prepend to resources"
  type        = string
  default     = "burns"
}

variable "tags" {
  description = "Freeform tags to apply to all applicable resources"
  type        = map(string)
  default = {
    "Environment" = "production"
    "Project"     = "burns"
    "ManagedBy"   = "terraform"
  }
}

variable "tenancy_ocid" {
  description = "Tenancy OCID/UID"
  type        = string
}

variable "vcn_cidr" {
  description = "CIDR to apply to VNC"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR to apply to the subnet"
  type        = string
}


variable "access_ip_address" {
  description = "The IP address you'd like to grant SSH access to the machine too."
  type        = string
}
