terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "1.22.2"
    }
  }
}

variable "pvt_key" {}

provider "digitalocean" {
  token = "540fc5978725da5173cd2b1540f047f1f9ffd97ae249f2b8f510d03ea94408e9"
}

data "digitalocean_ssh_key" "example" {
  name = "example"
}

data "digitalocean_image" "fossa" {
  name = "packer-1600152668"
}

