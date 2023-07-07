data "digitalocean_ssh_key" "ssh_key" {
  name = "flow"
}

resource "digitalocean_droplet" "web" {
  image  = "ubuntu-18-04-x64"
  name   = data.external.droplet_name.result.name
  region = "lon1"
  size   = "s-1vcpu-1gb"
  ssh_keys = [
    data.digitalocean_ssh_key.ssh_key.id
  ]
}
