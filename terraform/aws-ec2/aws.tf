terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = var.region
}
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_instance" "example" {
  ami                    = "ami-0ef2c681c6c4ff0e9"
  instance_type          = "t2.micro"
  key_name = "main"
  vpc_security_group_ids = ["sg-8b0fb4ef"]
  subnet_id              = "subnet-1a792a73"

  user_data = <<-EOF
              #!/bin/bash
              apt update
              uname -r
              EOF


}
resource "aws_eip" "ip" {
  vpc      = true
  instance = aws_instance.example.id
}

output "ip" {
  value = aws_eip.ip.public_ip
}
