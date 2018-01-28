
variable "zone" {}
variable "machine_type" {}
variable "disk_image" {}

variable "node_name" {
  type = "string"
  description = "The name for this swarm node"
}

variable "network" {
  type = "string"
  description = "The network to attach this swarm node"
}

variable "public_key_path" {
  type = "string"
  description = "Path to the SSH public key for provisioning this swarm node"
}

variable "private_key_path" {
  type = "string"
  description = "Path to the SSH private key for provisioning this swarm node"
}
