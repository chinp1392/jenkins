terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region     = "us-east-1"

}
resource "aws_instance" "myec2" {
   ami = "ami-067d1e60475437da2"
   instance_type = var.instance_size
   security_groups = [ ]
   key_name = "main"

   tags = {
    name = "Terraform"
 }

}

output "myec2ip" {
value = aws_instance.myec2.public_ip
}
