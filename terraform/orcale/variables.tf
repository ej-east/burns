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

########################
## Provider Variables ##
########################

variable "region" {
  description = "Region to target for deployment"
  type        = string
  default     = "us-ashburn-1"
}

variable "tenancy_ocid" {
  description = "Tenancy OCID/UID"
  type        = string
}

variable "user_ocid" {
  description = "User OCID Terraform will deploy as"
  type        = string
}

variable "fingerprint" {
  description = "Fingerprint of private key"
  type        = string
}

variable "private_key_path" {
  description = "Path to private authentication key"
  type        = string
}

variable "access_ip_address" {
  description = "IP address that has SSH access"
  type        = string
}

variable "vcn_cidr" {
  description = "CIDR of the VCN"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR of the VCN"
  type        = string
}

variable "ssh_key_path" {
  description = "Path to access SSH key"
  type        = string
}
