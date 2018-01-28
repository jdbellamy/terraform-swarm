// Initialize the swarm
module "swarm_init" {
  source = "modules/swarm_init"

  node_name = "node-0"

  zone = "us-central1-b"
  machine_type = "f1-micro"
  disk_image = "coreos-cloud/coreos-stable"
  network = "default"

  private_key_path = "${var.ssh_private_key_path}"
  public_key_path = "${var.ssh_public_key_path}"
}

// Add additional nodes
module "swarm_nodes" {
  source = "modules/swarm_node"

  nodes = {
    "node-1" = "manager"
    "node-2" = "manager"
    "node-3" = "worker"
    "node-4" = "worker"
    "node-5" = "worker"
    "node-6" = "worker"
    "node-7" = "worker"
    "node-8" = "worker"
    "node-9" = "worker"
  }

  zone = "us-central1-b"
  machine_type = "f1-micro"
  disk_image = "coreos-cloud/coreos-stable"
  network = "default"

  private_key_path = "${var.ssh_private_key_path}"
  public_key_path = "${var.ssh_public_key_path}"

  join_addr = "${module.swarm_init.join_addr}"
  manager_token = "${module.swarm_init.manager_token}"
  worker_token = "${module.swarm_init.worker_token}"
}
