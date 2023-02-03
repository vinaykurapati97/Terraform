resource "aws_key_pair" "abc" {
  key_name   = "abcd"
  public_key = file("terraaa.pub")
}

resource "aws_instance" "terra2" {
  ami                    = var.AMIS[var.region]
  instance_type          = "t2.micro"
  availability_zone      = var.zone1
  key_name               = aws_key_pair.abc.key_name
  vpc_security_group_ids = ["sg-09f216949941613f4"]
  tags = {
    Name = "terra-2"
  }


  provisioner "file" {
    source      = "gen.sh"
    destination = "/tmp/gen.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/gen.sh",
      "sudo /tmp/gen.sh"
    ]
  }

  connection {
    user        = var.USER
    private_key = file("terraaa")
    host        = self.public_ip
  }
}