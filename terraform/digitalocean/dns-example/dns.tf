resource "digitalocean_record" "www" {
  domain = var.domain_name
  type   = "A"
  name   = "test"
  value  = digitalocean_droplet.web.ipv4_address
}
