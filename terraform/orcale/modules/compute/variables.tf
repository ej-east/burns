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


variable "subnet_ocid" {
  description = "Subnet OCID/UID"
  type        = string
}

variable "shape" {
  description = "Shape of the VM"
  type        = string
  default     = "VM.Standard.A1.Flex"
}

variable "vm_cpu" {
  description = "Amount of CPU cores to assign to machine"
  type        = number
  default     = 1

  validation {
    error_message = "CPU Core Amount must be between 1-4"
    condition     = var.vm_cpu >= 1 && var.vm_cpu <= 4
  }
}

variable "vm_memory" {
  description = "Amount of Memory to assign to machine"
  type        = number
  default     = 4

  validation {
    error_message = "Memory Amount must be between 1-24"
    condition     = var.vm_memory >= 4 && var.vm_memory <= 24
  }
}

variable "vm_storage" {
  description = "Amount of storage to assign to machine"
  type        = number
  default     = 50

  validation {
    error_message = "Storage Amount must be between 50-200"
    condition     = var.vm_storage >= 50 && var.vm_storage <= 200
  }
}

variable "vm_ssh_key" {
  description = "Public SSH Key for access"
  type        = string
  sensitive   = true
}

variable "vm_image" {
  description = "The image to use as base on instance"
  type        = string
}

variable "availability_domain" {
  description = "The availability domain"
  type        = string
}

variable "private_ip_id" {
  description = "The ID of the private IP to reserve"
  type        = string
}
