data "digitalocean_ssh_key" "ssh_key" {
  name = "manage"
}

resource "digitalocean_tag" "k8s-node" {
  name = "k8s-node"
}



resource "digitalocean_droplet" "gw" {
  image  = "ubuntu-20-04-x64"
  name   = data.external.droplet_name.result.name
  tags   = [digitalocean_tag.k8s-mng.id]
  region = "lon1"
  size   = "s-1vcpu-1gb"
  ssh_keys = [
    data.digitalocean_ssh_key.ssh_key.id
  ]

  connection {
    host        = self.ipv4_address
    user        = "root"
    type        = "ssh"
    private_key = file(var.private_key)
    timeout     = "2m"
  }

  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      # Install Apache
      "apt update",
      "apt install python3 -y"
    ]
  }

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u root -i '${self.ipv4_address},' --private-key ${var.private_key} -e 'pub_key=${var.pub_key}' install.yml"
  }
}

