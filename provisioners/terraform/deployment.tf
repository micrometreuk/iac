resource "digitalocean_droplet" "vpn" {
    count = 1
    name  = "wgserver"
    image  = data.digitalocean_image.fossa.id
    ipv6   = true
    region = "lon1"
    size   = "s-1vcpu-2gb"
    ssh_keys = [data.digitalocean_ssh_key.example.id]
    connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = file(var.pvt_key)
    timeout = "2m"
  }
}
