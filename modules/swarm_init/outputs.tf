
locals {
  manager_token_from_file = "${file("manager.token")}"
  worker_token_from_file = "${file("worker.token")}"
}

output "join_addr" {
    value = "${google_compute_instance.swarm_init.network_interface.0.address}"
}

output "manager_token" {
    value = "${local.manager_token_from_file}"
}

output "worker_token" {
    value = "${local.worker_token_from_file}"
}
