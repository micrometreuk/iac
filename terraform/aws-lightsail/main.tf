
resource "aws_lightsail_key_pair" "lg_key_pair" {
  name       = "web"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_lightsail_static_ip" "hostsip" {
  name = "hostsip"
}

resource "aws_lightsail_instance" "hosts" {
  name              = "docker_host-1"
  availability_zone = "us-east-1a"
  blueprint_id      = "debian_10"
  bundle_id         = "micro_2_0"
  key_pair_name     = "web"

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "/tmp/script.sh args",
    ]
  }


  tags = {
    hosting = "bar"
  }
}
 
resource "aws_lightsail_static_ip_attachment" "web" {
  static_ip_name = aws_lightsail_static_ip.hostsip.name
  instance_name  = aws_lightsail_instance.hosts.name
 }



