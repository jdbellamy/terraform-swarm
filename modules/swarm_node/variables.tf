
variable "zone" {}
variable "machine_type" {}
variable "disk_image" {}

variable "nodes" {
  type = "map"
  description = "The names and types (worker or manager) of the additional swarm nodes to create"
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

variable "join_addr" {
  type = "string"
  description = "Address to use for joining nodes to the swarm"
}

variable "manager_token" {
  type = "string"
  description = "Token to use for joining manager nodes to the swarm"
}

variable "worker_token" {
  type = "string"
  description = "Token to use for joining worker nodes to the swarm"
}
