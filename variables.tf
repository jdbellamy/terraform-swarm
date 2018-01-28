
variable "project" {
  type = "string"
  description = "Google project name"
}

variable "region" {
  type = "string"
  description = "Google region"
}

variable "credentials_path" {
  type = "string"
  description = "Location of the Google account credentials json file"
}

variable "ssh_private_key_path" {
  type = "string"
  description = "Location of the private ssh key for provisioning"
}

variable "ssh_public_key_path" {
  type = "string"
  description = "Location of the public ssh key for provisioning"
}

variable "MANAGER_TOKEN" {
  type = "string"
  description = "Token to use for joining manager nodes to the swarm"
}

variable "WORKER_TOKEN" {
  type = "string"
  description = "Token to use for joining worker nodes to the swarm"
}
