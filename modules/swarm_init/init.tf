
resource "google_compute_instance" "swarm_init" {
  name         = "${var.node_name}"
  zone         = "${var.zone}"
  machine_type = "${var.machine_type}"
  tags         = ["swarm-manager"]

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
      "docker swarm init",
      "docker swarm join-token --quiet worker > /tmp/worker.token",
      "docker swarm join-token --quiet manager > /tmp/manager.token",
    ]
  }

  provisioner "local-exec" {
    command = <<EOF
scp -i ${var.private_key_path} -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null \
  core@${self.network_interface.0.access_config.0.nat_ip}:/tmp/\{manager.token,worker.token\} \
  .
EOF
  }
}
