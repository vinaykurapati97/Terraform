provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "intro" {
  ami                    = "ami-0b5eea76982371e91"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1a"
  key_name               = "terra"
  vpc_security_group_ids = ["sg-09f216949941613f4"]
  tags = {
    Name = "tf-instance"
  }

}