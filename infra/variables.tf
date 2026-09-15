variable "yc_folder_id" {
  description = "Yandex Cloud Folder ID"
  type = string
}

variable "yc_cloud_id" {
  description = "Yandex Cloud ID"
  type = string
}

variable "ssh_public_key" {
  description = "SSH Public Key"
  type = string
}

variable "yc_zone" {
  description = "Yandex Cloud Availability Zone"
  default = "ru-central1-a"
  type = string
}

variable "vpc_name" {
  description = "VPC Name"
  type = string
  default = "kittygram-vpc"
}

variable "subnet_name" {
  description = "VPC Name"
  type = string
  default = "kittygram-subnet"
}

variable "vm_name" {
  description = "VM Name"
  type = string
  default = "kittygram-vm"
}

variable "image_family" {
  description = "VM OS Family"
  type = string
  default = "ubuntu-2204-lts"
}

variable "platform_id" {
  description = "VM Platform ID"
  type = string
  default = "standard-v3"
}

variable "disk_type" {
  description = "VM Disk Type"
  type = string
  default = "network-hdd"
}

variable "disk_size" {
  description = "VM Disk Size (Gb)"
  type = string
  default = "20"
}

variable "vm_nat" {
  description = "Enable NAT on VM network"
  type = bool
  default = true
}
