resource "digitalocean_record" "www" {
  domain = var.domain_name
  type   = "A"
  name   = "k8s"
  value  = digitalocean_droplet.gw.ipv4_address
}
