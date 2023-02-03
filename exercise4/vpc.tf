resource "aws_vpc" "new" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "new"
  }
}

resource "aws_subnet" "new-pub-1" {
  vpc_id                  = aws_vpc.new.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1
  tags = {
    Name = "new-pub-1"
  }
}

resource "aws_subnet" "new-pub-2" {
  vpc_id                  = aws_vpc.new.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2
  tags = {
    Name = "new-pub-2"
  }
}

resource "aws_subnet" "new-pub-3" {
  vpc_id                  = aws_vpc.new.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE3
  tags = {
    Name = "new-pub-3"
  }
}

resource "aws_subnet" "new-priv-1" {
  vpc_id                  = aws_vpc.new.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1
  tags = {
    Name = "new-priv-1"
  }
}

resource "aws_subnet" "new-priv-2" {
  vpc_id                  = aws_vpc.new.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2
  tags = {
    Name = "new-priv-2"
  }
}

resource "aws_subnet" "new-priv-3" {
  vpc_id                  = aws_vpc.new.id
  cidr_block              = "10.0.6.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE3
  tags = {
    Name = "new-priv-3"
  }
}

resource "aws_internet_gateway" "new-IGW" {
  vpc_id = aws_vpc.new.id
  tags = {
    Name = "new-IGM"
  }
}

resource "aws_route_table" "new-pub-RT" {
  vpc_id = aws_vpc.new.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.new-IGW.id
  }
  tags = {
    Name = "new-pub-RT"
  }
}

resource "aws_route_table_association" "new-pub-1-a" {
  subnet_id      = aws_subnet.new-pub-1.id
  route_table_id = aws_route_table.new-pub-RT.id
}

resource "aws_route_table_association" "new-pub-2-a" {
  subnet_id      = aws_subnet.new-pub-2.id
  route_table_id = aws_route_table.new-pub-RT.id
}

resource "aws_route_table_association" "new-pub-3-a" {
  subnet_id      = aws_subnet.new-pub-3.id
  route_table_id = aws_route_table.new-pub-RT.id
}