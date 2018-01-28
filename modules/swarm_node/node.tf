
locals {
  node_names = "${keys("${var.nodes}")}"
  node_types = "${values("${var.nodes}")}"
}

resource "google_compute_instance" "swarm_node" {

  count = "${length("${var.nodes}")}"

  name         = "${local.node_names[count.index]}"
  zone         = "${var.zone}"
  machine_type = "${var.machine_type}"
  tags         = ["swarm-${local.node_types[count.index]}"]

  boot_disk {
    initialize_params {
      image = "${var.disk_image}"
    }
  }

  metadata {
    sshKeys = "core:${file("${var.public_key_path}")}"
  }

  network_interface {
    network = "${var.network}"
    access_config {}
  }

  connection {
    type = "ssh"
    user = "core"
    private_key = "${file("${var.private_key_path}")}"
    agent = false
  }

  provisioner "remote-exec" {
    inline = [
      "docker swarm join ${var.join_addr}:2377 --token ${local.node_types[count.index] == "worker" ? var.worker_token : var.manager_token}",
    ]
  }
}
