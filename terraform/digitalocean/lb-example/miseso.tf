resource "digitalocean_domain" "default" {
   name = "miseso.com"
   ip_address = digitalocean_droplet.www-1.ip
}


resource "digitalocean_record" "CNAME-www" {
  domain = digitalocean_domain.default.name
  type = "CNAME"
  name = "www"
  value = "@"
}
