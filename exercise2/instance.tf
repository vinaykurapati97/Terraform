resource "aws_instance" "terra2" {
  ami                    = var.AMIS[var.region]
  instance_type          = "t2.micro"
  availability_zone      = var.zone1
  key_name               = "terra"
  vpc_security_group_ids = ["sg-09f216949941613f4"]
  tags = {
    Name = "terra-2"
  }
}